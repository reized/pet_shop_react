import axios from 'axios';
import FormData from 'form-data';

class NextCloudService {
    constructor() {
        this.baseURL = process.env.NEXTCLOUD_URL || 'http://nextcloud';
        this.username = process.env.NEXTCLOUD_USER || 'admin';
        this.password = process.env.NEXTCLOUD_PASSWORD || 'admin123';
        this.auth = {
            username: this.username,
            password: this.password
        };
    }

    async uploadFile(fileBuffer, fileName, folder = 'petshop-images') {
        try {
            const url = `${this.baseURL}/remote.php/dav/files/${this.username}/${folder}/${fileName}`;
            
            const response = await axios.put(url, fileBuffer, {
                auth: this.auth,
                headers: {
                    'Content-Type': 'application/octet-stream'
                }
            });

            if (response.status === 201 || response.status === 204) {
                return this.getPublicLink(folder, fileName);
            }
            throw new Error('Upload failed');
        } catch (error) {
            console.error('NextCloud upload error:', error);
            throw error;
        }
    }

    async getPublicLink(folder, fileName) {
        try {
            // Create share
            const shareUrl = `${this.baseURL}/ocs/v2.php/apps/files_sharing/api/v1/shares`;
            const shareData = new FormData();
            shareData.append('path', `/${folder}/${fileName}`);
            shareData.append('shareType', '3'); // Public link
            shareData.append('permissions', '1'); // Read only

            const shareResponse = await axios.post(shareUrl, shareData, {
                auth: this.auth,
                headers: {
                    'OCS-APIRequest': 'true',
                    'Accept': 'application/json'
                }
            });

            if (shareResponse.data.ocs.data.url) {
                return shareResponse.data.ocs.data.url;
            }
            
            // Fallback to direct URL
            return `${this.baseURL}/index.php/s/${shareResponse.data.ocs.data.token}`;
        } catch (error) {
            console.error('NextCloud share error:', error);
            // Return direct access URL as fallback
            return `${this.baseURL}/remote.php/dav/files/${this.username}/${folder}/${fileName}`;
        }
    }

    async deleteFile(folder, fileName) {
        try {
            const url = `${this.baseURL}/remote.php/dav/files/${this.username}/${folder}/${fileName}`;
            await axios.delete(url, { auth: this.auth });
            return true;
        } catch (error) {
            console.error('NextCloud delete error:', error);
            return false;
        }
    }
}

export default new NextCloudService();