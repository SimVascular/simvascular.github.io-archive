$("a.thumbnail").click(function() {

    var $target         = "ani_"+$(this).attr("id");
    var $content_path   = "img/gallery/";

    
    // hide the current loaded poster
    $("img.vjs-poster").hide();
    
    $("div_video").ready(function() {
      var vjs = videojs("div_video");
      // hide the video UI
      vjs.hide();
      // and stop it from playing
      vjs.pause();
      // assign the targeted videos to the source nodes
      vjs.src([
        { type: "video/mp4", src: $content_path+$target+".mp4" },
        { type: "video/webm", src: $content_path+$target+".webm" },
        { type: "video/ogg", src: $content_path+$target+".ogv" }
      ]);
      // replace the poster source
      $("img.vjs-poster").attr("src",$content_path+$target+".jpg").show();

      vjs.removeClass("vjs-playing").addClass("vjs-paused");
      // load the new sources
      vjs.load();
      vjs.loop();
      vjs.show();
    });
});

$("a.thumbnail[id='CABG']").click();