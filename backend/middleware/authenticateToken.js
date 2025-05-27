import jwt from 'jsonwebtoken';

export function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1]; // Extract token

  if (!token) return res.sendStatus(401); // No token = unauthorized

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) {
      console.log('JWT error:', err.message); // Log reason
      return res.sendStatus(403); // Invalid token
    }
    req.user = user; // { id, iat, exp }
    next();
  });
}