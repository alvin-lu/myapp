var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'a/A' });
});

router.get('/responsive', function(req, res, next) {
  res.render('responsive', { title: 'a/A' });
});
module.exports = router;
