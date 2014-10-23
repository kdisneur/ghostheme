//= require jquery
//= require jquery-migrate/jquery-migrate
//= require modernizr.mtheme
//= require lodash
//= require slick/slick
//= require mtheme_helpers/post
//= require mtheme_helpers/site
//= require_self

var Mtheme = function () {};
Mtheme.prototype.init = function () {
  var site = new SiteHelper();
  site.init();

  var bc = this.bodyClass();

  if (_.contains(bc, 'home-template')) {
    var index = new IndexHelper();
    index.init();
  }

  if (_.contains(bc, 'post-template')) {
    var post = new PostHelper();
    post.init();
  }
};

Mtheme.prototype.bodyClass = function () {
  return document.querySelector('body').className;
};

var mtheme = new Mtheme();
mtheme.init();

$('.carousel').slick({
  adaptiveHeight: true,
  dots:           true,
  infinite:       true,
  slidesToShow:   1,
  slidesToScroll: 1,
});
