document.addEventListener('DOMContentLoaded', function(){
	       //이미지 객체 타입으로 이미지 확장자 밸리데이션
	       var validateType = function(img){
	           return (['image/jpeg','image/jpg','image/png'].indexOf(img.type) > -1);
	       }

	       var validateName = function(fname){
	           let extensions = ['jpeg', 'jpg', 'png'];
	           let fparts = fname.split('.');
	           let fext = '';
	       
	           if(fparts.length > 1){
	               fext = fparts[fparts.length-1];
	           }
	       
	           let validated = false;
	           
	           if(fext != ''){
	               extensions.forEach(function(ext){
	                   if(ext == fext){
	                       validated = true;
	                   }
	               });
	           }
	       
	           return validated;
	       }

	       // 파일 선택 필드에 이벤트 리스너 등록
	       document.getElementById('apply').addEventListener('change', function(e){
	           let elem = e.target;
	           if(validateType(elem.files[0])){
	               let preview = document.querySelector('.apply');
	               preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
	               preview.onload = function() {
	                   URL.revokeObjectURL(preview.src); //URL 객체 해제
	               }
	           }else{
	           console.log('이미지 파일이 아닙니다.');
	           }
	       });
	   });

// google map geocode api
function initMap() {
    console.log('Map is initialized.');

    /**
     * 맵을 설정한다.
     * 1번째 파라미터 : 구글 맵을 표시할 위치. 여기서는 #google-map
     * 2번째 파라미터 : 맵 옵션.
     *      ㄴ zoom : 맵 확대 정도
     *      ㄴ center : 맵 중심 좌표 설정
     *              ㄴ lat : 위도 (latitude)
     *              ㄴ lng : 경도 (longitude)
     */
    var map = new google.maps.Map(document.getElementById('map-sm'), {
        zoom: 3,
        center: {
            lat: 37.5000065,
            lng: 127.0356027
        }
    });

    /**
     * Google Geocoding. Google Map API에 포함되어 있다.
     */
    var geocoder = new google.maps.Geocoder();

    // submit 버튼 클릭 이벤트 실행
    document.getElementById("location").addEventListener('blur', function() {
        console.log('떼면 클릭 이벤트 실행');

        // 여기서 실행
        geocodeAddress(geocoder, map);
    });

    /**
     * geocodeAddress
     * 
     * 입력한 주소로 맵의 좌표를 바꾼다.
     */
    function geocodeAddress(geocoder, resultMap) {
        console.log('geocodeAddress 함수 실행');

        // 주소 설정
        var location = document.getElementById('location').value;
        console.log(location);
        /**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지. 
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         * 
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         */
        geocoder.geocode({'address': location}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                resultMap.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                resultMap.setZoom(16);
                // console.log("주소 나오나? "+result[0].geometry); .location 까지 붙이면 위경도 나옴
                
                var myIcon = new google.maps.MarkerImage("images/pin.png", null, null, null, new google.maps.Size(30,30));
                
                // 맵 마커
                var marker = new google.maps.Marker({
                    map: resultMap,
                    icon: myIcon,
                    position: result[0].geometry.location
                });
                //console.log("위도가 숫자가 아니면 "+isNaN(marker.position.lat())); 위경도는 숫자
                //console.log(result[0].geometry.location);
                // 위도
                console.log('위도(latitude) : ' + marker.position.lat());
                // 경도
                console.log('경도(longitude) : ' + marker.position.lng());
                
                $("#lat").val(marker.position.lat());
                $("#lng").val(marker.position.lng());
                //$("#location").val(address);
                
            } else {
            	if(address==null){
            		return false;
            	}
            	else{
            		alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            	}
            }
            
            
        });
    }
}

