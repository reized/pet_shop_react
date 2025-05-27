-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 27, 2025 at 02:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nama_jenis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_jenis`) VALUES
(1, 'Makanan Kucing'),
(2, 'Makanan Anjing'),
(4, 'Pasir Kucing'),
(5, 'Makanan Burung'),
(6, 'Aksesoris Kucing'),
(7, 'Aksesoris Anjing'),
(8, 'Aksesoris Burung'),
(9, 'Perobatan Kucing'),
(10, 'Perobatan Anjing'),
(11, 'Perobatan Burung'),
(12, 'Makanan Ikan');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `status` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(1024) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_url`, `jumlah_stok`, `category_id`, `createdAt`, `updatedAt`) VALUES
(2, 'Meo Snack/Cemilan Kering 50gr Me-O', 'Me-O Cat Treats adalah camilan renyah untuk kucing. Terbuat dari bahan berkualitas tinggi, Me-O Cat Treats tidak hanya lezat, tapi juga bermanfaat untuk kesehatan kucing. Berikan tambahan nutrisi terbaik untuk kucing Anda dengan Me-O Cat Treats:– Taurine untuk mempertajam penglihatan– Omega-3 untuk kulit sehat dan bulu berkilau– Tekstur renyah untuk mencegah plak di gigi Catatan: Me-O Cat Treats hanya boleh diberikan sebagai camilan. Untuk memenuhi kebutuhan nutrisi kucing Varian Rasa :– Shrimp– Salmon– Tuna,Chicken & Egg Cara Pememsanan :*Pilih varian rasa di menu varian, tidak menerima varian rasa melalui chat atau catatan pesanan', 14135, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922171357069_4782488177-600x600.jpg', 83, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(3, 'Meo Delite 70gr Makanan Kucing Basah Me-O', 'Me-O Delite adalah makanan basah premium dalam kemasan pouch yang praktis. Dibuat dari suwiran daging putih ikan tuna pilihan yang biasa dikonsumsi manusia (human-grade), Me-O Delite menyajikan nutrisi yang lengkap dan seimbang untuk kucing dalam cita rasa yang lezat. Cocok dikonsumsi kucing dewasa berusia di atas 1 tahun. Varian Rasa :– Tuna In Jelly– Tuna With Bonito in Jelly– Tuna With Chicken Flake in jelly– Tuna With Crab Stick in jelly Cara Pemesanan :*Pilih varian rasa langsung di menu varian, tidak menerima varian rasa melalui chat atau catatan pesanan', 9075, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922171204735_2766333963-600x600.jpg', 23, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(4, 'Meo Kaleng 400gr Makanan Kucing Basah Me-O', 'Me-O adalah makanan kucing lengkap dan bernutrisi seimbang. Me-O sangat mudah dicerna dan memiliki rasa yang disukai kucing. Cocok dikonsumsi untuk kucing dewasa berusia di atas 1 tahun. Penuhi kebutuhan kucing Anda dengan beragam keunggulan dalam Me-O:1. Taurin untuk meningkatkan kesehatan dan fungsi mata2. Omega-3 dan Omega-6 dari minyak berkualitas tinggi beserta Zinc untuk kulit dan bulu yang sehat3. Vitamin E untuk memperkuat sistem kekebalan tubuh4. Protein dari daging berkualitas tinggi dengan asam amino esensial untuk menjaga massa otot Nilai Gizi Terjamin:– protein kasar 10%,– lemak kasar 2%,– serat kasar 1%,– kandungan air 84% Varian Rasa :– Sardine– Seafood– Tuna Cara Pemesanan :*Pilih Varian rasa langsung di menu varian rasa, tidak menerima permintaan varian rasa di chat atau catatan pesanan', 20185, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922171012595_7836432280-600x600.jpg', 90, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(5, 'Meo Persian Kitten 1.1kg Makanan Kucing Kering Me-O', 'Me-O adalah makanan kucing lengkap dan bernutrisi seimbang. Me-O sangat mudah dicerna dan memiliki rasa yang disukai kucing. Me-O diformulasikan dengan nutrisi yang melampaui standar minimum yang ditetapkan oleh US National Research Council (NRC) dan Association of American Feed Control Officials (AAFCO). Cocok dikonsumsi untuk anak kucing (kitten ) ras Persia berusia 3-12 bulan. Penuhi kebutuhan kucing Anda dengan beragam keunggulan dalam Me-O:1. Anti-Hairball formula: mempermudah gumpalan bulu (hairball) yang tertelan dalam melewati saluran pencernaan, sehingga tidak menumpuk di usus2. Memelihara kesehatan sistem pencernaan dengan kandungan prebiotik (fruktooligosakarida/FOS) dan bubur buah bit.3. Formulasi yang disesuaikan untuk membantu mencegah penyakit saluran kemih bagian bawah (FLUTD/Feline Lower Urinary Tract Disease)4. Taurin untuk meningkatkan kesehatan dan fungsi mata5. Omega-3 dan Omega-6 dari minyak berkualitas tinggi beserta Zinc untuk kulit dan bulu yang sehat. Nilai Gi', 68530, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922171008043_5486894841-600x600.jpg', 0, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(6, 'Meo Adult 7kg Makanan Kucing Kering Me-O', 'Me-O adalah makanan kucing lengkap dan bernutrisi seimbang. Me-O sangat mudah dicerna dan memiliki rasa yang disukai kucing. Me-O diformulasikan dengan nutrisi yang melampaui standar minimum yang ditetapkan oleh US National Research Council (NRC) dan Association of American Feed Control Officials (AAFCO). Cocok dikonsumsi untuk kucing dewasa berusia lebih dari 1 tahun. Penuhi kebutuhan kucing Anda dengan beragam keunggulan dalam Me-O:1. Taurine untuk mempertajam penglihatan2. Vitamin C untuk kekebalan tubuh3. Kalsium, fosfor dan vitamin D untuk kekuatan tulang dan gigi4. Formulasi yang disesuaikan untuk membantu mencegah penyakit saluran kemih bagian bawah (FLUTD/Feline Lower Urinary Tract Disease)5. Omega 3, Omega 6, dan Zinc untuk menutrisi kulit dan bulu6. Kadar sodium yang rendah untuk mengurangi risiko penyakit jantung Nilai Gizi Terjamin: protein kasar 30%, lemak kasar 9%, serat kasar 4%, kandungan air 10% Varian Rasa :– Tuna– Seafood– Salmon– Gourmet– Beef Flavor & Vegetable– Ch', 281600, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922170914257_8403621024-600x600.jpg', 95, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(7, 'Bolt Kitten 20kg Makanan Anak Kucing Kering', 'Bolt Salmon Kitten Cat Food Kibble Half Moon Bolt Salmon Kitten Cat Food Kibble Half Moon merupakan pakan kucing yang tinggi protein untuk menunjang pertumbuhan kucing kitten, mendukung pembentukan gigi dan tulang, serta mampu meningkatkan fungsi pencernaan. Pakan ini juga baik untuk kesehatan kulit, bulu, dan penglihatan yang tajam. Untuk segala jenis kucing dengan usia dibawah 1 tahun Kemasan 20kg Komposisi :Tepung Ikan, Tepung Ayam, Jagung, Beras, Kedelai, Tepung Jagung, Minyak Ikan, Minyak Ayam, Ragi,Taurin, Vitamin dan Mineral, Antioksidan. Nilai gizi :Protein 30%, lemak 9%, serat 5%, abu 10%, kalsium 1%, fosfor 0.8%, kadar air 10% Keunggulan produk :Membuat kulit sehat dan bulu berkilau, mempertajam penglihatan, membantu menjaga kesehatan gigi, mengurangi resiko FLUTD ( penyakit saluran kemih pada kucing ), dan meningkatkan sistem imunitas', 451300, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922170909527_1891131087-600x600.jpg', 33, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(8, 'Beauty Premium 20kg Makanan Kucing Kering', 'Beauty Premium adalah makanan kucing kelas premium yang di buat dari bahan kuallitas premium dan di peruntukan untuk kucing dewasa dan kitten. 1. Diformulasikan untuk kitten dan kucing dewasa( all stages)2. Protein 32% di lengkapi dengan Taurine ( penting untuk ketajaman mata) dan asam amino acid sangat penting untuk mendukung sistem kekebalan tubuh, enzim, hormon dan jaringan otot serta sangat membantu agar anak kucing tumbuh dengan maksimal( slide right untuk guaranteed analysis)3. Kibble yang kecil banyak di sukai oleh kebanyakan kucing dengan rasa chicken dan salmon4. Ingredients dan Vitamin lengkap dari A-Z( slide 4 swipe kanan) membantu sistem pencernaan, kesehatan jantung, gigi dan tulang, kesehatan kulit, bulu2 yang bercahaya, dapat mengurangi bau dan meningkatkan fases (padat dan kering) karena mengandung extract Yucca. – Anti hairball– Diperkaya probiotik– Diperkaya natural enzyme– Menjaga saluran kencing– Menjaga kesehatan kulit dan bulu– Menjaga kesehatan mata– Merangsang n', 500000, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922170807218_1659646193-600x600.jpg', 12, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(9, 'Beauty Premium Makanan Kucing Kering Cat Food Dry', 'Beauty Premium adalah makanan kucing kelas premium yang di buat dari bahan kuallitas premium dan di peruntukan untuk kucing dewasa dan kitten. Keunggulan Beauty Premium :– Diformulasikan untuk kitten dan kucing dewasa( all stage)– Crude protein 30% dan crude fat 12% ( kibble kecil,rasa lezat dan renyah Chicken and Salmon)– Mengandung serat Psyllium dan ekstrak Yucca Schidigera untuk menjaga kesehatan usus & mengurangi bau dan meningkatkan kualitas feces( padat dan kering)– Mengandung asam amino acid sangat penting untuk mendukung sistem kekebalan tubuh, enzim, hormon dan jaringan otot serta sangat membantu agar anak kucing tumbuh dengan maksimal– Diperkaya dengan sayuran dan serat alami untuk meningkatkan kemampuan and kinerja usus. Menghilangkan gunpalan bulu ( Anti hairball)– Diperkaya dengan probiotik yg mengandung 5 strain bakteri untuk mendukung keseimbangan mikroflora usus– Diperkaya dengan natural enzyme untuk memelihara saluran pencernaan– Kadar abu rendah and rendah magnesium ', 20000, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922170621500_6758516306-600x600.jpg', 72, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(10, 'Cat Choize Adult 20kg Makanan Kucing Dewasa Dry Food', 'Cat Choize mengandung nutrisi lengkap, vitamin dan mineral yang membuat kucing Anda sehat. Dikembangkan dengan pola diet yang seimbang untuk memastikan pertumbuhan kucing yang optimal. Cat Choize cocok untuk semua jenis kucing dalam setiap tahap perkembangannya. Cocok Untuk Kucing 1 Tahun Keatas Keunggulan:– Kesehatan Gigi : tekstur kibble renyah membantu mengurangi pertumbuhan karang gigi dan memutihkan gigi.– Fungsi Pencernaan : Serat pilihan membantu menunjang fungsi pencernaan yang optimal– Kulit dan Bulu Sehat : Asam lemak omega 6 dan Zinc membuat kulit dan bulu sehat.– Penglihatan : Taurin membantu meningkatkan fungsi mata.– Tanpa Pewarna Buatan– Dijamin Tidak Mengandung Babi Nilai Gizi Terjamin:– Protein Kasar 27%,– Lemak Kasar 9%,– Serat Kasar 4%,– Kandungan Air 10%', 400000, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922164052198_2538138401-600x600.jpg', 56, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(11, 'Cat Choize Adult Makanan Kucing Dewasa Dry Food 800gr', 'Cat Choize mengandung nutrisi lengkap, vitamin dan mineral yang membuat kucing Anda sehat. Dikembangkan dengan pola diet yang seimbang untuk memastikan pertumbuhan kucing yang optimal. Cat Choize cocok untuk semua jenis kucing dalam setiap tahap perkembangannya. Cocok Untuk Kucing 1 Tahun Keatas Keunggulan:– Kesehatan Gigi : tekstur kibble renyah membantu mengurangi pertumbuhan karang gigi dan memutihkan gigi.– Fungsi Pencernaan : Serat pilihan membantu menunjang fungsi pencernaan yang optimal– Kulit dan Bulu Sehat : Asam lemak omega 6 dan Zinc membuat kulit dan bulu sehat.– Penglihatan : Taurin membantu meningkatkan fungsi mata.– Tanpa Pewarna Buatan– Dijamin Tidak Mengandung Babi Nilai Gizi Terjamin:– Protein Kasar 27%,– Lemak Kasar 9%,– Serat Kasar 4%,– Kandungan Air 10%', 20000, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922164043711_0585926542-600x600.jpg', 10, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(12, 'Cat Choize Kitten 20kg Makanan Anak Kucing Cat Food Dry', 'Cat Choize Kitten Food diformulasikan untuk memenuhi kebutuhan nutrisi anak kucing. Mengandung nutrisi lengkap, vitamin dan mineral yang membantu memperkuat sistem kekebalan tubuh, serta mendukung pertumbuhan dan perkembangan yang tepat pada anak kucing Anda pada masa pertumbuhannya. Cat Choize Kitten Food cocok untuksemua jenis anak kucing. Keunggulan:– Protein Berkualitas Tinggi : Sumber protein berkualitas dari ikan tuna asli, susu dan ayam membantu meningkatkan pertumbuhan otot dan perkembangan pada anak kucing.– Sistem Kekebalan Tubuh yang Sehat : Selenium dan Vitamin E membantu meningkatkan fungsi kekebalan tubuh anak kucing Anda.– Tulang dan Gigi yang Kuat : Kalsium, Fosfor, dan Vitamin D membantu memperkuat tulang dan gigi.– Palatibilitas tinggi untuk kitten. : Terbuat dari bahan-bahan berkualitas, anak kucing Anda akan menikmati kelezatan makanan sehari-harinya.– Tanpa Pewarna Buatan– Dijamin Tidak Mengandung Babi Nilai Gizi Terjamin:– Protein kasar 30%,– Lemak kasar 9%,– Sera', 455699, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922164029703_6870957832-600x600.jpg', 65, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(13, 'Cat Choize Kitten 1kg Makanan Anak Kucing Cat Food Dry', 'Cat Choize Kitten Food diformulasikan untuk memenuhi kebutuhan nutrisi anak kucing. Mengandung nutrisi lengkap, vitamin dan mineral yang membantu memperkuat  sistem kekebalan tubuh, serta mendukung pertumbuhan dan perkembangan yang tepat pada anak kucing Anda pada masa pertumbuhannya. Cat Choize Kitten Food cocok untuksemua jenis anak kucing. Keunggulan:– Protein Berkualitas Tinggi : Sumber protein berkualitas dari ikan tuna asli, susu dan ayam membantu meningkatkan pertumbuhan otot dan perkembangan pada anak kucing.– Sistem Kekebalan Tubuh yang Sehat : Selenium dan Vitamin E membantu meningkatkan fungsi kekebalan tubuh anak kucing Anda.– Tulang dan Gigi yang Kuat : Kalsium, Fosfor, dan Vitamin D membantu memperkuat tulang dan gigi.– Palatibilitas tinggi untuk kitten. : Terbuat dari bahan-bahan berkualitas, anak kucing Anda akan menikmati kelezatan makanan sehari-harinya.– Tanpa Pewarna Buatan– Dijamin Tidak Mengandung Babi Nilai Gizi Terjamin:– Protein kasar 30%,– Lemak kasar 9%,– Ser', 25000, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922163724290_7765680686-600x600.jpg', 0, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(14, 'Kucinta Kaleng Makanan Kucing Basah 400gr', 'nan', 16032, 'https://www.salanova.id/wp-content/uploads/2022/03/Makanan-Kucing-Kucinta-kaleng-400gr-600x600.jpg', 17, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(15, 'Snappy Tom Kaleng Makanan Kucing Basah 400gr', 'nan', 18150, 'https://www.salanova.id/wp-content/uploads/2022/03/Makanan-Kucing-Snappy-Tom-kaleng-400gr-600x600.jpg', 81, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(16, 'Markotops Sachet/Pouch Makanan Kucing Basah 85gr', 'nan', 6332, 'https://www.salanova.id/wp-content/uploads/2022/03/Makanan-Kucing-Markotops-Pouch-Wet-85gr-600x600.jpg', 64, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(17, 'Snappy Tom Sachet/Pouch Makanan Kucing Basah 85gr', 'nan', 6000, 'https://www.salanova.id/wp-content/uploads/2022/03/Makanan-Kucing-Snappy-Tom-Pouch-Wet-85gr-600x600.jpg', 96, 1, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(18, 'Vitapet Jerhigh Snack/Cemilan Anjing 100gr', 'nan', 33550, 'https://www.salanova.id/wp-content/uploads/2022/03/Snack-Anjing-Jerhigh-Vitapet-100gr-600x600.jpg', 15, 2, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(19, 'Jerhigh Den-t Stick Snack/Cemilan Anjing 70gr', 'nan', 25025, 'https://www.salanova.id/wp-content/uploads/2022/03/jerhigh-Den-t-70-600x600.jpg', 63, 2, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(20, 'Jerhigh Duo Stick Snack/Cemilan Anjing 50gr', 'nan', 25025, 'https://www.salanova.id/wp-content/uploads/2022/03/jerhigh-Duo-50gr-600x600.jpg', 0, 2, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(21, 'Jerhigh Snack/Cemilan Anjing 70gr', 'nan', 25022, 'https://www.salanova.id/wp-content/uploads/2022/03/snack-anjing-jerhigh-70-dan-50gr-600x600.jpg', 16, 2, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(22, 'Hokky Profesional Breeder 10kg Makanan Ikan Koi', 'Diadaptasi formula asal negeri jepang untuk keindahan warna dan meningkatkan berbagai aspek kesehatan, HOKKY menjangkau pakan premium bagi ikan hias, Koi impor, Louhan dan kura-kura. HOKKY FISH FOOD (Koi) adalah pakan seri khusus terbaik untuk pembibitan dan pemeliharaan Koi di lingkungan tropis. Menggunakan protein berkualitas tinggi dan proses produksi maju, formula kami secara teratur diuji di kolam -kolam pemelihara untuk memastikan konsistensi produk pakan kami menjangkau koi lokal hingga breed impor. Keunggulan HOKKY FISH FOOD PROFESSIONAL BREEDER :– Sangat direkomendasikan bagi peternak/budidaya/pembibitan koi– Mengandung protein alami untuk mempercepat pertumbuhan– Mineral dan vitamin yang dikombinasikan khusus untuk reproduksi ikan– Melancarkan pencernaan untuk mengoptimalkan metabolisme dan imunitas– Tanpa pewarna buatan dan menghambat pertumbuhan bakteri dalam kolam Ukuran Pelet :– Untuk ikan koi size s (2mm) 10-20cm– Untuk ikan koi size m (5mm) 20-35cm– Untuk ikan koi size ', 260000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135020874_1526179348-600x600.jpeg', 36, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(23, 'Hokky Color Max 100gr Makanan Ikan Mas Koki', 'HOKKY GOLDFISH COLOUR MAX adalah pakan untuk ikan mas dan ikan hias kecil lainnya. Ahli gizi kami telah berhasil mengembangkan produk yang baik bagi kesehatan pencernaan ikan, keindahan warna dan bentuk tubuh yang lebih baik, memperkuat sistem kekebalan tubuh dan mengurangi polusi dalam air kolam yang dapat membahayakan bagi ikan hias Anda Pakan serba guna untuk ikan mas dan ikan kecil lainnya Sangan cocok untuk penggemar ikan pemula, Pakan udah dicerna oleh ikan danmengurangi pencemaran dalam kolam Kandungan Nutrisi:– Protein: 40%– Lemak: 5%– Serat: 3,5%– Kadar Air: 12%– Kadar Abu: 10% Net Weight:– 100 gram Ukuran Pelet :– Mini Pelet– Tipe Pakan Floating (Mengapung)', 10000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135016492_4344263172-600x600.jpeg', 62, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(24, 'Hokky Louhan 100gr Makanan Ikan Louhan', 'HOKKY LOUHAN 3 IN 1 dan COLOR ENHANCER adalah makanan ikan tipe premium yang bisa membuat warna ikan louhan tampil cerah dan mempesona. Manfaat:– Kaya akan protein dan nutrisi– Membantu percepat warna louhan– Membantu pertumbuhan jenong louhan– Menambah kekebalan tubuh louhan– Mengurangi stress pada louhan Keunggulan:– Hyper Red, menjadikan warna ikan louhan anda menjadi merah natural– Sangat mudah dicerna– Kandungan nutrisi yang lengkap dan seimbang– Super immune, tahan penyakit– Anti stress– Protein tinggi 50% Spesifikasi:– Ukuran butiran: 1 mm (kecil/small/mini)– Tipe: Mengambang (floating type)– Tidak mengeruhkan air– Terbuat dari bahan alami pilihan, tanpa zat pewarna buatan', 20000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135008035_7698667459-600x600.jpeg', 64, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(25, 'Hokky Gold Fish 100gr Balance Nutrition Makanan Ikan Mas Koki', 'HOKKY GOLDFISH BALANCE NTRITION adalah pakan untuk ikan mas dan ikan hias kecil lainnya. Ahli gizi kami telah berhasil mengembangkan produk yang baik bagi kesehatan pencernaan ikan, keindahan warna dan bentuk tubuh yang lebih baik, memperkuat sistem kekebalan tubuh dan mengurangi polusi dalam air kolam yang dapat membahayakan bagi ikan hias Anda Pakan serba guna untuk ikan mas dan ikan kecil lainnya Sangan cocok untuk penggemar ikan pemula, Pakan udah dicerna oleh ikan danmengurangi pencemaran dalam kolam Kandungan Nutrisi:– Protein: 40%– Lemak: 5%– Serat: 3,5%– Kadar Air: 12%– Kadar Abu: 10% Net Weight:– 100 gram Ukuran Pelet :– 1mm– Tipe Pakan Floating (Mengapung)', 5000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135003929_2334679316-600x600.jpeg', 79, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(26, 'Hokky Wheat Germ 1kg Makanan Ikan Koi', 'Hokky Wheat Germ Secara alami mengandung vitamin E dosis tinggi dan linolenic acid yang berguna untuk memperbaiki sistem pencernaan dan sebagai sumber protein alami dengan Kandungan vitamin E dosis tinggi terbukti meningkatkan kesehatan organ tubuh, kemampuan reproduksi dan mempercepat penyembuhan luka pada sisik ikan dan juga Membantu mempercepat pertumbuhan dan mencerahkan serta menambah kilau warna ikan. Kaya akan vitamin C yang membantu mengatasi stress dan meningkatkan kekebalan terhadap infeksi dan penyakit .Membantu penyerapan makanan selama perubahan suhu lingkungan pada saat cuaca lebih dingin Nutritional content:– Crude Protein: 32%– Crude Fat: 3%– Crude Fiber: 3%– Moisture: 10% Ukuran Pelet :– Small    2mm– Medium 5mm– Large    7 mm KomposisiWheatgerm, tepung cumi-cumi, marine yeast, tepung gandum, tepung ikan, tepung kedelai, asam amino (methionine dan lysine), mineral, vitamin, serta diperkaya dengan Vitamin C.', 57200, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913134952425_4780962852-600x600.jpeg', 53, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(27, 'Hokky Growth Formula 1kg Makanan Ikan Koi', 'Hokky Growth Formula Mengandung probiotic yang baik untuk sistem pencernaan ikan koi dan meningkatkan kekebalan tubuh, membantu pertumbuhan Lactobasillus dan menghambat pertumbuhan bakteri yang berbahaya dan juga membantu pertumbuhan ikan koi, untuk mencapai berat dan ukuran yang ideal, jauh lebih cepat dari pakan lainnya. Pakan ikan mengapung dan tidak membuat air keruh.. Membantu mencerahkan warna ikan koi hingga maksimal Ukuran Pelet :– Size S /2mm small– Size M /5mm medium– Size L / 7mm Large Pemberian Pakan:Berikan pakan 2 – 4 kali sehari pada saat suhu diatas 20C (68F).Berikan pakan secukupnya untuk dikonsumsi ikan anda selama 5 menit. Kandungan Nutrisi:Crude Protein : 40 %.Crude Fat : 4 %.Crude Fiber : 1.5 %.Ash : 12 %.Moisture : 10 %. Komposisi:Wheat germ meal, white fish meal, Wheat flour, Spirulina.Vitamin B12 suplement, Biotin, Calcium pantothenate, Choline chloride.', 58080, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913134944911_2659799561-600x600.jpeg', 89, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(28, 'Hokky Color Enhancer 1kg Makanan Ikan Koi', 'Hokky Fish Food Color Enhancer merupakan pakan bernutrisi tinggi dan seimbang, mengandung vitamin dan mineral yang berguna untuk meningkatkan kekebalan tubuh, daya tahan terhadap stress dan membantu mengoptimalkan pertumbuhan untuk membentuk tubuh yang ideal.  membantu mencerahkan warna koi anda dalam 1 minggu sekaligus tetap menjaga kecerahan warna putihnya.  Diformulasikan dari Wheat Germ dan Cithin (chitosan) untuk mengoptimalkan pencernaan dan meningkatkan fungsi hai sehingga koi akan jauh lebih kebal terhadap berbagai penyakit.  Pertumbuhan ikan akan lebih baik dengan memberikan tambahan pakan Hokky Fish Food Growth Formula  Ukuran Pelet : – Size S / 2mm  small    – Size M / 5mm  Medium   – Size  L / 7mm Large  Pemberian Pakan : Berikan 2 – 4 kali sehari pada saat suhu di atas 20C (68F). Berikan pakan secukupnya untuk dikonsumsi ikan anda selama 5 menit  Komposisi : Crude Protein (Min.40%), Crude Fat (Min.3%), Crude Fiber (max.1.5%), Ash(max.12%), Moisture (max.10%)', 55000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913134731239_1391570341-600x600.jpeg', 99, 12, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(29, 'Phoenix Perkutut Platinum 500gr Pakan Burung Perkutut Juara Gacor', 'PHOENIX PERKUTUT PLATINUMPhoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. PHOENIX PERKUTUT PLATINUM (500gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli perkutut dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. MANFAAT :– Meningkatkan fungsi kognitif dan kemampuan visual pada burung– Meningkatkan kekebalan imun tubuh dan daya tahan tubuh burung– Mengoptimalkan fungsi saraf– Mencerdaskan otak burung– Sebagai pakan persiapan lomba kicau– Sumber nutrisi, protein, dan vitamin tinggi yang baik untuk pertumbuhan burung– Meningkatkan daya tahan tubuh dan stamina perkutut– Menstabilkan metabolisme tubuh dan Menambah nafsu makan– Maksimalkan performa dan Meningkatkan kelincahan– Sebagai Anti Stress untuk perkutut KANDUNGAN :Millet Put', 30750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135213221_0917082577-600x600.jpeg', 56, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(30, 'Phoenix Terkuku 350gr Pakan Burung Perkutut Milet Putih Merah', 'PHOENIX TERKUKUPhoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. PHOENIX TERKUKU (350gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli derkuku dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. Sangat cocok dijadikan makanan sehari-hari untuk jenis burung derkuku MANFAAT :– Meningkatkan fungsi kognitif dan kemampuan visual pada burung dan mencerdaskan burung– Sumber vitamin, nutrisi, dan protein tinggi– Menjaga kesehatan sel-sel tubuh dari radikal bebas/polusi udara dan mencerahkan warna bulu– Meningkatkan imunitas, stamina, dan daya tahan tubuh– Sebagai anti-stress dan mempercepat pertumbuhan– Menstabilkan metabolisme tubuh dan Menambah nafsu makan KANDUNGAN :Millet Putih, Millet Merah, Ketan Hitam, Beras Merah, Kacang Hijau, Om', 15000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135209092_0164494237-600x600.jpeg', 12, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(31, 'Phoenix Lovebird Multivitamin 330gr Pakan Burung Lovebird', 'PHOENIX LOVEBIRD MULTIVITAMINPhoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. PHOENIX LOVEBIRD MULTIVITAMIN (200gr/330gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli lovebird dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. Sangat cocok dijadikan makanan sehari-hari untuk jenis burung lovebird MANFAAT :– Sumber protein dan lemak tinggi– Menghangatkan tubuh saat musim hujan dan sebagai sumber energi– Sumber protein dan omega 3 yang tinggi– Sebagai anti peradangan– Membuat bulu burung berkilau– Meningkatkan produktivitas burung– Mengoptimalkan aliran darah dan sistem kerja jantung– Sebagai antioksidan untuk menjaga fungsi sel-sel pada tubuh burung agar selalu sehat dan terhindar dari radikal bebas, polutan, zat-zat yang tidak ', 18750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135205043_9690324765-600x600.jpeg', 21, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(32, 'Phoenix Perkutut Gold 350gr Pakan Burung Perkutut Plus Gingseng, Milet, Jewawut, Ketan Hitam', 'Phoenix Perkutut Gold Gingseng Millet Ketan Hitam Jewawut Phoenix Pakan Burung Murah Berkualitas dan Terpercaya se Indonesia Phoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. Phoenix Perkutut Gold (350gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli perkutut dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. Sangat cocok dijadikan makanan sehari-hari untuk jenis burung perkutut lokal maupun perkutut bangkok. MANFAAT :– Sumber protein tinggi yang baik untuk pertumbuhan burung– Sumber nutrisi dan vitamin tinggi agar burung lebih berenergi.– Meningkatkan voluma dan kualitas “kung”– Meningkatkan stamina dan daya tahan tubuh– Membantu pertumbuhan anakan burung– Sebagai anti-stress dan mengatasi kerontokan– Menstabilkan metabolisme tu', 16500, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135201263_3860035445-600x600.jpeg', 0, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(33, 'Phoenix Vitamix Lovebird 330gr Pakan Burung Lovebird Juara Gacor', 'Phoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. VITAMIX LOVEBIRD adalah pakan yang dicampur secara ekslusif dari biji-bijian alami pilihan berkualitas tinggi diimport dari kanada, diformulasikan secara ilmiah serta diproses dengan higenis dan bersih tanpa campuran bahan kimia dan pengawet VITAMIX LOVEBIRD (330gr) dibuat khusus untuk burung lovebird sebelum dilombakan, karena mengandung berbagai multivitamin dan mineral yang dibutuhkan burung lovebird agar kondisi tetap stabil dan fresh, serta membantu sistem kekebalan tubuh burung dan anti oksidan MANFAAT :– Sebagai perawatan khusus sebelum dilombakan– Meningkatkan sistem kekebalan tubuh dan anti oksidan– Sebagai sumber nutrisi, vitamin, dan energi– Sebagai sumber kalsium dan sodium untuk burung KANDUNGAN :Millet Putih, Millet Merah, beberapa jenis biji-bijian, Multivitamin, dan Essential Mineral CARA PAKAI :Berikan VITAMIX LOVEBIRD secukupnya 2-3 har', 12750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135157284_0931070861-600x600.jpeg', 50, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(34, 'Phoenix Millie Lovebird 400gr Pakan Burung Love Bird Gacor', 'PHOENIX MILLIE LOVEBIRDPhoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. PHOENIX MILLIE LOVEBIRD (350gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli lovebird dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. Sangat cocok dijadikan makanan sehari-hari untuk jenis burung lovebird MANFAAT :– Sebagai antioksidan untuk menjaga fungsi sel-sel pada tubuh burung agar selalu sehat dan terhindar dari radikal bebas dari udara– Mencegah stress panas & Mempercepat pertumbuhan– Membangun dan memelihara struktur sel. Pematangan normal tulang rawan matriks tulang– Meningkatkan Metabolisme lemak dengan mempercepat pembuangan atau mengurangi penumpukan lemak di hati.– Menjaga kualitas tarik suara burung– menjaga nafsu makan serta membuat burung', 17250, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135153533_2671210056-600x600.jpeg', 71, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(35, 'Phoenix Canary Multivitamin 330gr Pakan Burung Kenary', 'PHOENIX CANARY MULTIVITAMINPhoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. PHOENIX CANARY MULTIVITAMIN (200gr/330gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli kenari dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. Sangat cocok dijadikan makanan sehari-hari untuk jenis burung kenari MANFAAT :– Sumber vitamin, nutrisi, dan protein tinggi– Membantu pertumbuhan kenari dan mendongkrak stamina sehingga burung lebih aktif dan bergairah– Menguatkan pernafasan sehingga suara kicauan kenari dan lovebird lebih panjang– Meningkatkan kekebalan tubuh terhadap infeksi berbagai agen penyakit virus dan bakteri– Mengatasi gangguan pencernaan dan menjaga kesehatan sel-sel tubuh dari radikal bebas/polusi udara dan mencerahkan warna bulu KAN', 19500, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135149355_9397138061-600x600.jpeg', 24, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(36, 'Phoenix Perkutut Spesial Formula 200gr Pakan Burung Perkutut Milet Ketan Hitam', 'Phoenix Pakan Burung Murah Berkualitas dan Terpercaya se IndonesiaPhoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. Phoenix Perkutut Special Formula Plus (230gr) diramu khusus dari bahan baku pilihan berdasarkan rekomendasi dari para ahli ahli perkutut dari Indonesia dan Thailand yang sudah berpengalaman bertahun-tahun di industri pakan burung. Pakan Phoenix diproses secara higenis sehingga kebersihan dan kualitas produknya sangat terjamin. MANFAAT :– Sumber protein tinggi yang baik untuk pertumbuhan burung atau saat burung perkutut sedang mengerami telur.– Sumber nutrisi, protein, dan vitamin tinggi agar burung lebih berenergi.– Membantu menghangatkan badan perkutut terutama di musim penghujan– Meningkatkan daya tahan tubuh dan stamina perkutut– Menstabilkan metabolisme tubuh dan Menambah nafsu makan– Maksimalkan performa dan Meningkatkan kelincahan– Sebagai Anti Stress untuk perkutut KANDUNGAN :Millet', 9750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135145166_0834665732-600x600.jpeg', 16, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(37, 'Phoenix Vitamix Canary 330gr Pakan Burung Canary Juara Gacor', 'Phoenix merupakan brand pakan burung berkualitas dan terpercaya se-Indonesia! Pakan ideal untuk menjaga kesehatan dan stamina burung. VITAMIX CANARY adalah pakan yang dicampur secara ekslusif dari biji-bijian alami pilihan berkualitas tinggi diimport dari kanada, diformulasikan secara ilmiah serta diproses dengan higenis dan bersih tanpa campuran bahan kimia dan pengawet VITAMIX CANARY (330gr) dibuat khusus untuk burung kenari sebelum dilombakan, karena mengandung berbagai multivitamin dan mineral yang dibutuhkan burung kenari agar kondisi tetap stabil dan fresh, serta membantu sistem kekebalan tubuh burung dan anti oksidan MANFAAT :– Sebagai perawatan khusus sebelum dilombakan– Meningkatkan sistem kekebalan tubuh dan anti oksidan– Sebagai sumber nutrisi, vitamin, dan energi– Sebagai sumber kalsium dan sodium untuk burung KANDUNGAN :Millet Putih, Millet Merah, beberapa jenis biji-bijian, Multivitamin, dan Essential Mineral CARA PAKAI :Berikan 1 – 1/2 sendok makan VITAMIX CANARY setiap ', 16500, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913135140877_2434118417-600x600.jpeg', 66, 5, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(38, 'Cattiee Cat Pasir Kucing Tofu Soya Gumpal Wangi 7 Liter', 'Magnet kelembaban alami dirancang secara unik untuk menggumpal dengan cepat. Pasir kucing ramah lingkungan yang terbuat dari kedelai alami murni. Menggumpal dengan cepat setelah kontak dengan cairan.Secara efektif menetralkan bau tak sedap dari kotoran kucing kalian Biodegradable dan terbuat dari 100% kedelai alami. TOFU SOYA CLUMPING adalah pasir kucing yang sehat dan aman yang ramah terhadap hewan peliharaan, manusia, dan lingkungan. Sifatnya yang larut dalam air memungkinkan pemilik kucing untuk membuang kotorannya hanya dengan membuangnya ke toilet. Butiran bebas debu 99% lunak di kaki kucing dan membantu mengurangi pelacakan yang tidak diinginkan. Pasir ini terdiri dari 100% bahan berkualitas. Tersedia pilihan aroma:– Cappuccino– Cotton Candy– Greentea– Chocolate– Charcoal– Vanilla Ice Cream *Untuk carian aroma bisa langsung dipilih melalui menu varian produk, tidak menerima permintaan varian di menu chat atau catatan pesanan', 60000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230924154907347_7445339535-600x600.jpeg', 97, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(39, 'Pasir Kucing Khatulistiwa Pasir Gumpal Wangi 10 Liter', 'Pasir kucing pendatang baru merek KHATULISTIWA adalah pasir kucing premium buatan lokal dalam negeri, dengan daya gumpal yang baik dan minim debu, menjadikan pasir kucing ini layak kamu coba. Varian Aroma :– Lavender– Coffee– Lemon– Apple Pengiriman Hanya Khusus Gojek Cara Pememsanan :* Pilih varian aroma di menu varian, tidak menerima pilihan arima di chat atau catatan pesanan', 36000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230924154858167_3817917044-600x600.jpeg', 90, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(40, 'Vetsand Pro Pasir Kucing Gumpal Bentonite VetnSand 20kg', 'Bebeda dengan pasir vetsand zeolite, pasir kucing Vetsand PRO terbuat dari campuran Bentonite dan Zeolite yang menjadikannya pasir kucing dengan daya gumpal lebih bagus dan minim debu dibandingkan dengan vetsand zeolite. Untuk aroma sama dengan Vetsand Zeolite tidak terlalu menyegat Varian Aroma :– Lavender– Coffee– Lemon *Cara PemesananPilih varian aroma dimenu plihan aroma, tidak menerima pilihan aroma di menu chat atau catatan pesanan', 69550, 'https://www.salanova.id/wp-content/uploads/2022/09/ginee_20220922170705940_4911307666-600x600.jpg', 77, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(41, 'Markotops Pasir Kucing Gumpal Wangi 25 Liter', 'nan', 132000, 'https://www.salanova.id/wp-content/uploads/2022/03/Pasir-Kucing-Markotops-25-Liter-600x600.jpg', 9, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(42, 'Markotops Tofu Soya Pasir Kucing Gumpal Wangi 7 Liter', 'nan', 67100, 'https://www.salanova.id/wp-content/uploads/2022/03/Pasir-kucing-markotops-tofu-soya-7-liter-600x600.jpg', 75, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(43, 'Top Cat Litter Pasir Kucing Gumpal Wangi 25 Liter', 'nan', 114950, 'https://www.salanova.id/wp-content/uploads/2022/03/Pasir-kucing-top-20-liter-600x600.jpg', 63, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(44, 'Top Cat Litter Pasir Kucing Gumpal Wangi 10 Liter', 'nan', 54670, 'https://www.salanova.id/wp-content/uploads/2022/03/Pasir-kucing-top-10-liter-600x600.jpg', 43, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(45, 'Top Cat Litter Pasir Kucing Gumpal Wangi 5 Liter', 'nan', 30250, 'https://www.salanova.id/wp-content/uploads/2022/03/Pasir-kucing-top-5-liter-600x600.jpg', 38, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(46, 'Cub N Kit Pasir Kucing Gumpal Wangi 5 Liter', 'nan', 34980, 'https://www.salanova.id/wp-content/uploads/2022/03/pasir-kucing-cubnkit-5-liter-600x600.jpg', 14, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(47, 'Cub N Kit Pasir Kucing Gumpal Wangi 10 Liter', 'nan', 66000, 'https://www.salanova.id/wp-content/uploads/2022/03/pasir-kucing-cubnkit-10-liter-600x600.jpg', 83, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(48, 'Cub N Kit Pasir Kucing Gumpal Wangi 20kg', 'nan', 133100, 'https://www.salanova.id/wp-content/uploads/2022/03/pasir-kucing-cubnkit-20kg-600x600.jpg', 77, 4, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(49, 'Max Worm Obat Cacing Kucing, Anjing', 'Merupakan obat cacing Efektif, Cepat dan Ampuh bagi kucing kecil dan dewasa, juga anjing kecil dan dewasa, dengan spektrum luas sehingga efektif membasmi segala jenis cacing, baik stadium telur, larva dan dewasa. Indikasi :– Efektif membasmi semua jenis cacing dan stadium cacing, cacing gelang, pita, tambang, pipih, atau cambuk, jantung, dan usus (ringworms) Kontra Indikasi :Tidak dianjurkan untuk kucing pada usia kehamilan dibawah 45hari Dosis :– Berat badan dibawah 3kg : 2.5ml atau 1/2 sendok teh– Berat badan dibawah 4-6kg : 5ml atau 1 sendok teh– Berat badan dibawah 7-12kg : 15ml atau 1/2 botol Cara Pemakaian obat :– Pada kondisi sakit infeksi cacing berat berikan 2 jam sebelum makan selama 3 hari berturut-turut– Pada kondisi sehat untuk pencegahan diberikan 1-3 bulan sekali tergantung kondisi lingkungan * Sebaiknya langsung diteteskan / disuapkan kedalam mulut hewan peliharaan — Kocok dahulu sebelum digunakan — * Masa penyimpanan 2 bulan setelah segel dibuka', 15000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140434298_3098611384-600x600.jpeg', 64, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(50, 'Max Antic Obat Antibiotik Kucing', 'MAX ANTIC untuk Kucing & Anjing – Obat antibiotik– Anti Flu– Anti Diare Kemasan isi 30ml INDIKASI :Infeksi pencernaan (diare) dan pernafasan(pilek dan batuk) pada anjing dan kucing *** KAPAN KUCING/ANJING YANG SEDANG SAKIT PERLU DIBERI OBAT ANTIBIOTIK ?? *** – Kucing/Anjing terlihat lemah, badannya hangat (panas), tidak nafsu makan– Mengalami flu dan batuk yang tidak kunjung sembuh dengan obat flu kucing/anjing biasa– Feses terlihat tidak normal (cair atau ada bercak darah)', 15000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140426046_1184507394-600x600.jpeg', 46, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(51, 'Max Earvhy Obat Tetes Telinga Kucing', 'MAX EARVHY adalah obat tetes telinga kucing dan anjing, cocok untuk mebersihkan atau mengobati segala hal yang berhubungan dengan telinga anabul kamu. Kemsan 30ml Dapat Mengatasi :– Ganguan Kutu Masuk Telinga– Bakteri didalam telinga– Inveksi Telinga Cara Penggunaan :– Cukup diteteskan ketelinga secukupnya 3 kali sehari', 12000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140417721_9199096435-600x600.jpeg', 26, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(52, 'Max O Fish 70ml Minyak Ikan Salmon Untuk Kucing, Anjing dll', 'OFISH Adalah minyak ikan salmon yang sangat berguna untuk Kucing dan Anjing kamu dirumah, selain sangat berguna OFISH ini lebih praktis karena dengan kemasan botol tetes. Manfaat Minyak Ikan Salmon :– Merawat kesehatan kulit dan bulu– Mengurangi kerontokan bulu– Mendukung kesehatan jantung dan tulang– Mengurangi alergi– Meningkatkan sistem imun– Meningkatkan daya tahan tubuh– Menambah nafsu makan Saran Pemakaian :Campurkan minyak ikan salmon ke makanan atau boleh langsung diminumkan secara langsung ke anjing atau kucing Dosis Pemakaian :– Cukup 1-2 Pump Sehari', 24750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140413508_7854851659-600x600.jpeg', 35, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(53, 'Max Vcoco 70ml Minyak Kelapa Murni VCO', 'VCOco adalah VCO yang terbuat dari 100% minyak kelapa murni, banyak manfaat jika diberikan ke anabul kesayangan kamu. Manfaat :– Menyediakan hingga 70% dari kebutuhan energi otak– Dapat membunuh patogen berbahaya penyebab infeksi, seperti bakteri, virus, jamur dan kutu– Menambah nafsu makan– Mengobati cacingan– Membantu sistem pencernaan menjadi lebih baik– Membantu menyerap berbagai jenis vitamin dan mineral yang larut dalam lemak– Memberikan nutrisi kulit sehingga dapat membuat bulu menjadi lebih halus dan lembut– Menjaga imunitas tubuh– Membuat bulu hewan jadi mengkilat dan lebih lembut Kelebihan Vcoco :– 100% Minyak Kelapa Organik– Non-GMO & FREE Hexane– Tanpa Proses Kimia– Aman dan menyehatkan untuk kucing dan anjing Cara Penggunaan Diluar :– Spray/Oleskan pada bulu yang botak akibar scabies/jamur Cara Penggunaan Diminum :– 1/4 Sendok Teh untuk < 1.5kg berat badan (1 x sehari)– 1/2 Sendok Teh untuk 2.5kg berat badan (1 x sehari)– 1 Sendok Teh untuk 5kg berat badan (2 x sehari) Car', 18750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140409151_7077816432-600x600.jpeg', 37, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(54, 'Max Gumy 10ml Obat Sariawan dan Bau Mulut Hewan Kucing & Anjing', 'Max Gumy adalah obat sariawan untuk kucing, anjing, kelinci atau hewan peliharaan lainnya. Max Gumy merupakan obat yang diformulasikan secara khusus untuk mengatasi sariawan dan bau mulut dengan komposisi herbal Kenggulan Max Gumy :– Ampuh untuk mengatasi sariawan pada kucing– Terbuat dari bahan-bahan herbal– Anti-septik dan anti-jamur– Aman dikosumsi untuk kucing hamil dan menyusui Cara Pemakaian :– Kitten (Anak Kucing) Dua sampai empat tetes (3xSehari)– Adult (Kucing Dewasa) Empat sampai enam tetes (3xSehari)', 12750, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140405344_7993003257-600x600.jpeg', 35, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(55, 'Max Petwound 10gr Obat Tabur Luka Hewan Kucing & Anjing', 'Petwound adalah obat serbuk luka seperti kudis, Eksim, Koreng, Gatal-gatal yang disebabkan oleh bakteri, dan luka habis operasi dan juga mengobati segala luka. Indikasi :Kudis, Eksim, Koreng, Gatal-gatal yang disebabkan oleh bakteri, jamur, parasit, kutu, luka bakar, luka terbuka dan luka habis operasi Komposisi :Tiap gram mengandung Ampiclicin Trihydrate – 100mg Aturan Pakai :Bersihkan Luka terlebih dahulu. Taburkan 2-3 kali sehari pada luka terbuka dan bernanah', 10000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140400275_0974369707-600x600.jpeg', 42, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(56, 'Max Anti Kutu Obat Anti Kutu Kucing', '— OBAT ANTI KUTU SUPER AMPUH — Max Flea & Tick adalah obat anti kutu yang sudah aman digunakan karena menggunakan bahan herbal sehingga aman terjilat Dosis & Cara Pakai– Campurkan 1 bungkus MAX FLEA & TICK 1L air + shampo– Gosokan ke seluruh tubuh kucing– Tunggu 2-3 menit, kemudian bilas dengan air bersih– Untuk kutu yang parah, gunakan 2 sachet * Untuk menghilangkan bersih sampai telur2 nya, mandikan anabul kamu 1 Minggu 2 Kali', 5000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140356359_0257843177-600x600.jpeg', 95, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(57, 'Max Kill Tick 250ml Anti Kutu Spray Kucing dan Anjing', 'Max Kill Tick adalah obat kutu spray yang sangat ampuh membasmi kutu kucing dan anjing, Max Kill Tick juga sangat aman untuk anabul kamu karena mempunyai kandungan yang aman untuk anabul kesayangan kamu. Spesfikasi :– Kemasan : 250ml– Bentuk : Botol Spray– Fungsi : Obat Kutu Kucing dan Anjing Keunggulan :– 100% aman terjilat / terhirup anabul kesayagan kamu– Sangat aman untuk anabul kitten dan puppy– Aman juga untuk anabul yang sedang hamil dan menyusui', 30000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140352467_8916481940-600x600.jpeg', 56, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(58, 'Max Drop Lib 10ml Penurun Libido Kucing', 'MAX DROP LIB √ Menekan libido√ Menenangkan sifat agresif√ Membuat kucing jantan dan betina tenang isi kemasan 10ml Dapat digunakan untuk :– Menekan libido / gairah pada kucing jantan dan betina– Menenangkan sifat agresif dan stress kucing– Membuat kucing betina dan jantan lebih tenang dan aktif Mangandung chamomile, lemon gras dan catnip yang ampuh dan aman dipakai untuk kucing. Dosis :– 1x sehari 3 tetes– Digunakan pada malam hari atau pada saat tingkat birahi kucing tinggi.', 12000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140348736_0395395822-600x600.jpeg', 51, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(59, 'Max Healthy Urine 30ml Obat Radang Kemih Kucing', 'MAX HEALTHY URINE Obat herbal anti radang kemih.Untuk mengatasi pipis berdarah dan melancarkan yang diakibatkan radang. Kemasan 30ml Indikasi :– Demam tinggi, nafsu makan hilang dan depresi– Susah buang air kecil dan stress– Gejala muntah dan lemas Aturan Pakai :– Kucing Besar 8-12 tetes– Kucing Sedang 6-8 tetes– Kucing Kecil 4-6 tetes– Diberikan 3x sehari sampai sembuh– Diteteskan langsung ke mulut kucing– Diberikan 1 jam sebelum makan', 12000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140344807_6749885292-600x600.jpeg', 9, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(60, 'Max The Tick Obat Kutu Tetes Kucing', '1ml 2ml Obat Kutu Tetes Anjing KucingHewan 0-10kg dan 10-20kg Cara Pemakaian :– Mandikan anjing / kucing 1-2 hari sebelum menggunakan Max The Tick– Teteskan Max The Tick ke kulit tengkuk anjing / kucing, pastikan cairan mengenai kulit, bukan di bulu.– Teteskan perlahan2 sambil memastikan cairan meresap ke dalam kulit. Catatan:– 1 ml untuk anjing / kucing berat 0-10 kg– 2 ml untuk anjing / kucing berat 10-20 kg, dst– Jangan sampai terjilat oleh anjing / kucing anda atau anjing / kucing lain.– Tidak bisa untuk anjing / kucing yang sedang hamil.– Anjing / kucing boleh mandi atau berenang minimal 48 jam setelah penggunaan.– Usia anjing / kucing minimal 8 minggu.– Tidak cocok untuk kelinci.', 15600, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140340689_3947583613-600x600.jpeg', 85, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(61, 'Max Fellbio 30ml Vitamin Penumbuh Bulu', 'MAX FELLBIO ( Vitamin Penumbuh Bulu Kucing)Netto : 30ml MAX FELLBIO adalah suplemen Vitamin untuk menumbuhkan kembali dan menyuburkan bulu – bulu kucing kesayangan yang rontok akibat stress dan botak karena jamur. Normalnya hasil bisa terlihat dalam 2 – 3 minggu bila penyebab kerontokan sudah teratasi. Manfaat :√ Mempercepat pertumbuhan bulu kucing√ Mencegah kerontokan dan kebotakan bulu√ Melembutkan dan mengkilapkan bulu Dosis dan Aturan Pakai :– Anak kucing (kitten) usia sampai 6 bulan ( 3 – 4 tetes sehari)– Kucing remaja usia sampai 1 tahun ( 4 – 6 tetes sehari)– Kucing dewasa ( 6 – 8 tetes sehari)', 12000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140336941_9854503578-600x600.jpeg', 76, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(62, 'Max Vetri 30ml Penambah Nafsu Makan Kucing', 'MAX VETRI 30mlVitamin penambah nafsu makan dan penggemuk kucing cat kitten anjing puppy INDIKASI :– Menambah nafsu makan– Memperkuat daya tahan tubuh– Memulihkan kondisi sehabis sakit– Memperbaiki kondisi terbelakang DOSIS :Berat Badan 0 – 10 kg = 5-10 tetesBerat Badan 10 – 20 kg = 15 – 20 tetesBerat Badan 20 – 40 kg = 25 – 35 tetes', 12000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140332793_0924962493-600x600.jpeg', 86, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(63, 'Max Procat 20gr Susu Bubuk Kucing', 'MAX PROCAT / SUSU FORMULA KUCINGSemua usia, Kaya nutrisi, Meningkatkan kekebalan tubuh & mencegah kerontokan bulu kucing MANFAAT :Susu MAX PROCAT mengandung protein, lemak, kalsium, dan vitamin yang penting untuk kesehatan kucing. Ini dapat membantu memenuhi kebutuhan nutrisi kucing, terutama jika kucing kesulitan untuk makan makanan kucing yang lengkap.', 4800, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140328250_6918829455-600x600.jpeg', 76, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51'),
(64, 'Max Bulu Vitamin Suplemen Melebatkan Bulu Kucing', '— MENJAGA KESEHATAN BULU ANABUL KAMU — Max Vitamin Bulu dapat melebatkan, melembutkan dan juga mempercepat pertumbuhan bulu anabul kamu. Aturan Pakai :– Menjaga Kesehatan : 1 kapsul/hari– Mengatasi kerontokan : 2 kapsul/hari– Melebatkan bulu : 2 Kapsul/hari Saran Penggunaan :– Campur dengan makanan basah– Masukan vitamin langsung ke mulut kucing (kapsul aman termakan) Isi : 5 Kapsul/ Sachet', 10000, 'https://www.salanova.id/wp-content/uploads/2023/09/ginee_20230913140324358_9267846942-600x600.jpeg', 8, 9, '2025-05-26 14:27:51', '2025-05-26 14:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` char(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
