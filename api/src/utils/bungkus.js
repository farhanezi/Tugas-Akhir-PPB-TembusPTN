// Express 4 tidak menangkap error dari fungsi async; pembungkus ini meneruskannya ke penangananError.
module.exports = (fn) => (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
