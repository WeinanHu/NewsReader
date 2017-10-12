

//$document.ready(function(){
//        hiddenElement();
//    });
hiddenElement();
function hiddenElement(){
    //  gg-item news-gg-img3
    hideElementDivByClass("gg-item news-gg-img3");
    hideElementDivByClass("news-item news-img3");
    //  dfh-btn
    hideElementDivByClass("dfh-btn");
    //  baiduimageplusm-title-img-only
    hideParentParentParentElementDivByClass("baiduimageplusm-title-img-only");
    
    //  gg-item
    hideElementDivByClass("gg-item");
    
    //  xszh-toindex
    hideElementDivByClass("xszh-toindex");
    
    //  news_check
    hideElementDivById("news_check");
    
    //  pack-red    icon-pack
    hideElementDivByClass("pack-red");
    hideElementDivById("icon-pack");
    
    clearHrefByTagName("a");

}

function hideParentElementDivByClass(obj){
    var divs = document.getElementsByClassName(obj);
    //设置 div 属性   visibility: hidden; display: none;
    //div[0].setAttribute("visibility", "hidden");
    //div[0].setAttribute("display", "none");
    // var word = "section[class*="+obj+"]";
    // var divs = $(word);
    for(var i=0;i<divs.length;i++){
        divs[i].parentNode.setAttribute("style", "visibility: hidden; display: none;");
    }
}
function hideParentParentParentElementDivByClass(obj){
    var divs = document.getElementsByClassName(obj);
    //设置 div 属性   visibility: hidden; display: none;
    //div[0].setAttribute("visibility", "hidden");
    //div[0].setAttribute("display", "none");
    // var word = "section[class*="+obj+"]";
    // var divs = $(word);
    for(var i=0;i<divs.length;i++){
        divs[i].parentNode.parentNode.parentNode.setAttribute("style", "visibility: hidden; display: none;");
    }
}
function hideElementDivByClass(obj) {
	var divs = document.getElementsByClassName(obj);
 	//设置 div 属性   visibility: hidden; display: none;
	//div[0].setAttribute("visibility", "hidden");
	//div[0].setAttribute("display", "none");
	// var word = "section[class*="+obj+"]";
	// var divs = $(word);
	for(var i=0;i<divs.length;i++){
		divs[i].setAttribute("style", "visibility: hidden; display: none;");
	}
 }

function hideElementDivById(obj) {
	var div = document.getElementById(obj);
 	//设置 div 属性   visibility: hidden; display: none;
	div.setAttribute("style", "visibility: hidden; display: none;");

 }

function clearHrefByTagName(obj){
	var divs = document.getElementsByTagName(obj);
	for(var i=0;i<divs.length;i++){
		// divs[i].href = "";
		divs[i].removeAttribute("href");
	}
}
