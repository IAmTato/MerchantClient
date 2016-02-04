services.factory('Notices', function() {
  // Might use a resource here that returns a JSON array
  var notices = [{
    id: 0,
    name: '商家1',
    lastText: '套餐1 20元',
    face: 'img/ionic.png'
  }, {
    id: 1,
    name: '商家2',
    lastText: '套餐2 20元',
    face: 'img/ionic.png'
  }, {
    id: 2,
    name: '商家3',
    lastText: '套餐3 20元',
    face: 'img/ionic.png'
  }, {
    id: 3,
    name: '商家4',
    lastText: '套餐4 20元',
    face: 'img/ionic.png'
  }, {
    id: 4,
    name: '商家5',
    lastText: '套餐5 20元',
    face: 'img/ionic.png'
  }];

  return {
    all: function() {
      return notices;
    },
    remove: function(notice) {
      notices.splice(notices.indexOf(notice), 1);
    },
    get: function(noticeId) {
      for (var i = 0; i < notices.length; i++) {
        if (notices[i].id === parseInt(noticeId)) {
          return notices[i];
        }
      }
      return null;
    }
  };
});
