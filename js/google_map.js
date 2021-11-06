var google;
function initMap() {

	//console.log("확인,"+loca);
    //console.log(mem);
	
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 2,
        center: { lat: 16.527435302680107, lng: 155.51877073580954 },
    }); 
    var myIcon = new google.maps.MarkerImage("images/pin.png", null, null, null, new google.maps.Size(30,30));
    
    //인포윈도우
    var infowindow = new google.maps.InfoWindow();
    
    for (var i = 0; i < loca.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            //label: loca[i].location,
            position: new google.maps.LatLng(loca[i].lat, loca[i].lng),
            icon: myIcon
        });
        //console.log(i);
    
	    google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	        	var popup=
	        		'<a href="post.do?pno='+loca[i].pno+'">'+
	        			'<img src="'+loca[i].imgname+'" class="smimg"><br><span class="mapinfo">'+loca[i].location+
	        		'</span></a>';
	            //html로 표시될 인포 윈도우의 내용
	            infowindow.setContent(popup);
	            //인포윈도우가 표시될 위치
	            infowindow.open(map, marker);
	        }
	    })(marker, i));
	    
	    if (marker) {
	        marker.addListener('click', function() {
	            //중심 위치를 클릭된 마커의 위치로 변경
	            map.setCenter(this.getPosition());
	            //마커 클릭 시의 줌 변화
	            map.setZoom(12);
	        });
	    }
    }
    
}
google.maps.event.addDomListener(window, 'load', initMap);