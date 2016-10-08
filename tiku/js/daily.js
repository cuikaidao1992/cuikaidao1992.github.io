
var n=0;
var l=$(".dateList").find("li").length;
$(".date-list").find(".next").click(function(){
    if(n<Math.floor(l/7)){
        n++;
        $(".dateList").animate({
            left:-n*870
        })
    }
});
$(".date-list").find(".prev").click(function(){
    if(n>0){
        n--;
        $(".dateList").animate({
            left:-n*870
        })
    }
});
$(".dateMore").click(function(){
    $(".date-chose").toggle()
});
