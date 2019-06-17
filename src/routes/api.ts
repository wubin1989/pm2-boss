var express = require('express');
var router = express.Router();
var pm2 = require('pm2');

router.get('/', function(req, res, next) {
  res.redirect(req.baseUrl + '/info')
});

router.get('/info', function(req, res, next) {
  res.json({
    version: 0.1,
    name: 'pm2-boss'
  });
});

router.get('/pm2', function (req, res, next) {
  pm2.connect(function(err) {
    if (err) {
      console.error(err);
      process.exit(2);
    }

    pm2.list(function (err, processDescriptionList) {
      pm2.disconnect();   // Disconnects from PM2
      if (err) throw err
      res.json(processDescriptionList)
    })
  });
})

router.get('/pm2/:pmId', function (req, res, next) {
  let pmId = req.params.pmId
  pm2.connect(function(err) {
    if (err) {
      console.error(err);
      process.exit(2);
    }

    pm2.describe(pmId,function (err, processDescription) {
      pm2.disconnect();   // Disconnects from PM2
      if (err) throw err
      res.json(processDescription)
    })
  });
})

module.exports = router;
