// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(function() {

    $('#home a').click(function (e) {
      e.preventDefault()
      $(this).tab('show')
    })

    $('.show_comment_field').click(function () {
      $(this).siblings('.comment_field').removeClass('hidden');
      $(this).addClass('hidden');
    })

    $(".pop").popover({ trigger: "manual" , html: true, animation:false})
    .on("mouseenter", function () {
        var _this = this;
        $(this).popover("show");
        $(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
    }).on("mouseleave", function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) {
                $(_this).popover("hide");
            }
        }, 300);
});

  function toggleCurrentJob() {
      $("#end-date").toggleClass( "hidden" );
      $("#current-working").toggleClass("hidden");
  }

  $('.max_number_connections').popover({ trigger: "hover" });

    
  $('#home a').click(function (e) {
    e.preventDefault()
    // $(this).tab('show')
  })

  $('#education a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })
  // $('#certs a').click(function (e) {
    // e.preventDefault()
    // $(this).tab('show')
  // })


  $("tr[data-link]").click(function() {
   window.location = $(this).data("link");
  })

});
