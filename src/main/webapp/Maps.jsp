<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<%  
//DB에있는 CAR 데이터 리스트 생성
    Admin admin1 = new Admin();
    int carid1 = Integer.parseInt(request.getParameter("carid"));
    admin1.getListofCars();
    Car car1 = admin1.getCarById(carid1); 
%>


<div id="map" style="width:300px;height:300px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script>
<script>


var carPositions1 = [];

<% 

            //데이터 유효성 검사
            if(car1.getLocationX() != null && car1.getLocationY() != null && !car1.getLocationX().trim().isEmpty()) {
%>
            //carPositions배열에 데이터 푸쉬
                carPositions1.push({
                    title: '<%= car1.getCarname() %>',
                    carid: '<%= car1.getCarid() %>',
                    lat: parseFloat('<%= car1.getLocationX() %>'), 
                    lng: parseFloat('<%= car1.getLocationY() %>'),
                    filename: '<%= car.getFileName() %>'
                });
    var mapContainer = document.getElementById('map'), 
    mapOption = {
        center: new kakao.maps.LatLng(carPositions1[0].lat, carPositions1[0].lng), 
        level: 2 
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); 
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var ps = new kakao.maps.services.Places(); 

<% 
            }
 
%>

// 렌트카 마커들이 위치한 영역을 저장할 객체
var markerBounds = new kakao.maps.LatLngBounds();
var hasValidMarkers = false;

// 렌트카 마커 생성
for (var i = 0; i <= carPositions1.length; i++) {
    if(isNaN(carPositions1[i].lat) || isNaN(carPositions1[i].lng)) continue;

    var markerPosition = new kakao.maps.LatLng(carPositions1[0].lat, carPositions1[0].lng);
    
    var carMarker = new kakao.maps.Marker({
        map: map,
        position: markerPosition,
        title: carPositions1[i].title 
    });

    kakao.maps.event.addListener(carMarker, 'click', makeClickListener(map, carMarker, carPositions1[0].title, carPositions1[0].carprice,carPositions1[0].carid,carPositions1[0].filename));
    
    markerBounds.extend(markerPosition);
    hasValidMarkers = true;
}

function makeClickListener(map, marker, title,carprice,carid,filename) {

    return function() {
       
        infowindow.setContent('<table ><tr><td width="100px" align="left">'+     
            '<img  src="./img/'+filename+'" class="d-block w-100" alt="..."></td>'+
            '<td  align="rligt" style="padding : 1rem"><b>'+title);
        infowindow.open(map, marker);
    };
}
var searchBounds = new kakao.maps.LatLngBounds();
searchBounds.extend(new kakao.maps.LatLng(carPositions1[0].lat, carPositions1[0].lng));



// 스크립트 로드 완료 시 최초 1회 검색 실행

</script>
</body>
</html>
