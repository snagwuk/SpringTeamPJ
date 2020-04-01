<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.col-lg-8 {flex:0 0 66.6666667%; margin:0 auto; max-width:80%;}
.col-md-8 {margin-top:60px;}
.wform {margin:0 auto;}
.single-input-parea {  width:60%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }
.single-input-a1 {  width:40%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }
.single-input { width:70%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }
li {list-style-type:none; float:left; outline:1px; margin-left:40px;}
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>
<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
      <br><br><br>
<h3 class="mb-30">등급관리</h3>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="원하는 등급 검색" title="Type in a name">

<table id="myTable">
  <tr class="header">
    <th style="width:60%;">ID</th>
    <th style="width:40%;">등급</th>
  </tr>
  <tr>
    <td>한별</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Berglunds snabbkop</td>
    <td>Sweden</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Koniglich Essen</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Canada</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Italy</td>
  </tr>
  <tr>
    <td>North/South</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Paris specialites</td>
    <td>France</td>
  </tr>
</table>
</div></div></div>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>
