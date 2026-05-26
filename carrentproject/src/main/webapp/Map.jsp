<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLClassLoader" %>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<%  
    Admin admin = new Admin();
    ArrayList<Car> cars = admin.getListofCars();
%>
<body>

 <form onsubmit="searchPlaces(); return false;">
                    <input type="hidden" value="<%=request.getParameter("local")%>" id="keyword" size="15" > 
                </form>



<div id="map" style="width:90%;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script>
<script>

var mapContainer = document.getElementById('map'), 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), 
        level: 5 
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); 
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var ps = new kakao.maps.services.Places(); 

var carPositions = [];
<% 

    if(cars != null) {
        
        for(int i=0; i<cars.size(); i++) {
            Car car = cars.get(i);
            if(car.getLocationX() != null && car.getLocationY() != null && !car.getLocationX().trim().isEmpty()) {
%>
                carPositions.push({
                    title: '<%= car.getCarname() %>',
                    carid: '<%= car.getCarid() %>',
                    carprice: '<%= car.getCarprice() %>',
                    lat: parseFloat('<%= car.getLocationX() %>'), 
                    lng: parseFloat('<%= car.getLocationY() %>')
                });
<% 
            }
        }
        
    }
%>

// 렌트카 마커들이 위치한 영역을 저장할 객체
var markerBounds = new kakao.maps.LatLngBounds();
var hasValidMarkers = false;

// 렌트카 마커 생성
for (var i = 0; i < carPositions.length; i++) {
    if(isNaN(carPositions[i].lat) || isNaN(carPositions[i].lng)) continue;

    var markerPosition = new kakao.maps.LatLng(carPositions[i].lat, carPositions[i].lng);
    
    var carMarker = new kakao.maps.Marker({
        map: map,
        position: markerPosition,
        title: carPositions[i].title 
    });

    kakao.maps.event.addListener(carMarker, 'click', makeClickListener(map, carMarker, carPositions[i].title, carPositions[i].carprice,carPositions[i].carid));
    
    markerBounds.extend(markerPosition);
    hasValidMarkers = true;
}

function makeClickListener(map, marker, title,carprice,carid) {
    return function() {
        infowindow.setContent('<table ><tr><td width="100px" align="left">'+     
            '<img  src="./img/TSLA-model-3.png" class="d-block w-100" alt="..."></td>'+
            '<td  align="rligt" style="padding : 1rem"><b>'+title+
            '</b></td><td><p>'+carprice+'원</p></td>'+
            '<td><a class="btn btn-success" href="Payment.jsp?carid='+carid+'">예약하기</a></tr></table>');
        infowindow.open(map, marker);
    };
}

// 키워드 검색 로직
function searchPlaces() {
    
    var keyword = document.getElementById('keyword').value.trim();

    if (keyword !== "") {
        // 검색어가 있으면 카카오맵 장소 검색 실행
        ps.keywordSearch(keyword, placesSearchCB); 
    } else {
        // 검색어가 비어있으면 렌트카들이 전부 보이는 위치로 지도 자동 이동
        alert('지역을 입력해주세요');
        return false;
    }
}

function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        var searchBounds = new kakao.maps.LatLngBounds();
        for (var i=0; i<data.length; i++) {
            // 마커 생성(displayMarker) 코드는 제외하고 좌표 영역(Bounds)만 확장합니다.
            searchBounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        // 마커는 안 찍고 검색된 영역으로 지도 카메라만 휙 이동시킵니다.
        map.setBounds(searchBounds);
    } 
}

// 스크립트 로드 완료 시 최초 1회 검색 실행
searchPlaces();
</script>
</body>
</html>
