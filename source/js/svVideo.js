$("a.thumbnail").click(function(){

    var $target         = "ani_"+$(this).attr("id");
    var $content_path   = "img/gallery/";
    
    $("div_video").ready(function() {
      
      // Assign Video Object
      var vjs = videojs("div_video");

      // Show Poster
      $("#div_video .vjs-poster").show();
      
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
      var myposter = $content_path+$target+".png";
      vjs.poster(myposter);

      // Pause
      vjs.removeClass("vjs-playing").addClass("vjs-paused");

      // Load the new sources
      vjs.load();
      //vjs.loop();
      vjs.show();
    });
});

$("a.thumbnail[id='CABG']").click();