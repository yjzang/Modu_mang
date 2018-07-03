<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-06-29
  Time: 오후 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
    <title>모두의 가계부</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu_sh.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body style="overflow-x:hidden; overflow-y:auto;">


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>




<div class="container">

    <br><br>
    <!-- <div align="Right" style="margin-right: 60px;"><input type="button" name="" value="막대형"><input type="button" name="" value="파이형"></div>
        <br> -->
    <div align="center" style="margin-top: 50px">

        <input type="button" value="<" id="yearPrev">
        <input type="text" id="yearOutput" readonly="readonly" class="form_decade" data-date="" data-date-format="yyyy년" data-link-field="dtp_input3" data-link-format="yyyy" style="text-align: center;" placeholder="년도 선택" onchange="isChanged()">
        <input type="button" value=">" id="yearNext">
    </div>
    <br>
    <div class="mb-3">
        <div>
            <div align="center"><span style="font-size: 40px" id="annualReportTitle1"><strong>XX년 상반기</strong></span></div>
            <div class="mx-auto" id="graph1" style="width: 90%; height: 500px;"></div>
            <div style="width: 1173px;">
                <table class="table" style="text-align: center; table-layout: fixed;">
                    <thead>
                    <tr>
                        <th scope="col" style="width: 127px;">#</th>
                        <th scope="col">1월</th>
                        <th scope="col">2월</th>
                        <th scope="col">3월</th>
                        <th scope="col">4월</th>
                        <th scope="col">5월</th>
                        <th scope="col">6월</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <br><br>
        <div>
            <div align="center"><span style="font-size: 40px" id="annualReportTitle2"><strong>XX년 하반기</strong></span></div>
            <div class="mx-auto" id="graph2" style="width: 90%; height: 500px;"></div>
            <div style="width: 1173px;">
                <table class="table" style="text-align: center; table-layout: fixed;">
                    <thead>
                    <tr>
                        <th scope="col" style="width: 127px;">#</th>
                        <th scope="col">7월</th>
                        <th scope="col">8월</th>
                        <th scope="col">9월</th>
                        <th scope="col">10월</th>
                        <th scope="col">11월</th>
                        <th scope="col">12월</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <br>
    </div>
    <div align="Right" style="margin-right: 60px;">
        <input type="button" name="" value="보고서 출력" onClick="fnPrint()">
    </div>
    <br>



</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<<!-- 라인 그래프 출력을 위한 파일 include -->
<link class="include" rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.css" />
<link class="include" rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.js"></script>
<!-- 막대 그래프 출력을 위한 파일 include -->
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.barRenderer.min.js"></script>
<!-- 원형 그래프 출력을 위한 파일 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.pieRenderer.min.js"></script>
<!-- 그래프 수치 표시를 위한 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.pointLabels.min.js"></script>
<!-- 범례 표시 위한 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
<!--  -->
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/excanvas.min.js"> </script>
<!-- 달력 출력을 위한 include -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> -->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
<script type="text/javascript">

    $(document).ready(function(){
        $('.menuTab').removeClass("active");
        $("#btn_report").addClass("active");
        $(".dropdown-item").removeClass("active");
    });

    var fnPrint = function() {
        window.print();
    };

    var isChanged = function(){
        var mm = $("#yearOutput").val();
        var year = $("#yearOutput").val();
        year = Number(year.substr(0,4));
        $("#yearOutput").val(year+"년");
        $("#annualReportTitle1").html("<strong>"+year+"년 상반기</strong>");
        $("#annualReportTitle2").html("<strong>"+year+"년 하반기</strong>");
    };
    $(document).on("ready",function(){
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = today.getMonth()+1;
        var dd = today.getDate();
        $("#yearOutput").val(yyyy+"년");
        $("#annualReportTitle1").html("<strong>"+yyyy+"년 상반기</strong>");
        $("#annualReportTitle2").html("<strong>"+yyyy+"년 하반기</strong>");
        $('.form_decade').datetimepicker({
            language:  'ko',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 4,
            minView: 4,
            forceParse: 0
        });
        $('#yearPrev').on("click",function(){
            var year = $("#yearOutput").val();
            year = Number(year.substr(0,4));
            year -= 1;
            $("#yearOutput").val(year+"년");
            $("#annualReportTitle1").html("<strong>"+year+"년 상반기</strong>");
            $("#annualReportTitle2").html("<strong>"+year+"년 하반기</strong>");
        });
        $('#yearNext').on("click",function(){
            var year = $("#yearOutput").val();
            year = Number(year.substr(0,4));
            year += 1;
            $("#yearOutput").val(year+"년");
            $("#annualReportTitle1").html("<strong>"+year+"년 상반기</strong>");
            $("#annualReportTitle2").html("<strong>"+year+"년 하반기</strong>");
        });
    });

    $(function() {
        var income1 = [[' ',560000],['  ',560000],['   ',560000],['    ',560000],['     ',560000],['      ',560000]];
        var spend1 = [[' ',1000000],['  ',5000000],['   ',4500000],['    ',2300000],['     ',3500000],['      ',1400000]];
        $.jqplot('graph1', [income1,spend1], {
            title: '',
            animate:true,
            // seriesColors:['#ff0000','#0000ff'],
            legend:{
                renderer:$.jqplot.EnhancedLegendRenderer,//범례 설정
                show:true,//출력유무
                placement:'inside',//출력위치 설정
                location:'ne',
                marginTop:'15px'
            },
            series: [{//첫번째 그래프 설정
                renderer: $.jqplot.BarRenderer//막대그래프로 출력
                ,label:'수입'//막대 이름설정
                , pointLabels: { show: true, stackedValue : true  }//수치 표기
                ,rendererOptions: {//만들기 옵션
                    animation: {
                        speed: 1500    //animation 설정 시 속도
                    }
                    /* 그림자 */
                    ,shadow: false
                    //shadowDepth: 10, 그림자
                    /* 막대에 관한 라인 */
                    ,showLine: true
                    /* 각각의 막대그래프 램던 색 여부 */
                    ,varyBarColor: false
                    /* 막대 넓이 */
                    ,barWidth: 20      //bar width 설정
                    ,barPadding: 20  //bar padding
                    ,barMargin: 0      //bar간 간격
                }
            },
                {//두번째 그래프 설정
                    renderer: $.jqplot.BarRenderer
                    ,label:'지출'
                    , pointLabels: { show: true, stackedValue : true  }
                    ,rendererOptions: {
                        animation: {
                            speed: 1500    //animation 설정 시 속도
                        }
                        /* 그림자 */
                        ,shadow: false
                        //shadowDepth: 10, 그림자
                        /* 막대에 관한 라인 */
                        ,showLine: true
                        /* 각각의 막대그래프 램던 색 여부 */
                        ,varyBarColor: false
                        /* 막대 넓이 */
                        ,barWidth: 20      //bar width 설정
                        ,barPadding: 20  //bar padding
                        ,barMargin: 0      //bar간 간격
                    }
                }],

            axes: {//축 설정
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                },
                yaxis: {
                    tickOptions:{formatString:"%'d"}
                }
            }
        });
        var income2 = [[' ',560000],['  ',560000],['   ',560000],['    ',560000],['     ',560000],['      ',560000]];
        var spend2 = [[' ',2900000],['  ',4800000],['   ',2700000],['    ',1500000],['     ',5000000],['      ',5700000]];
        $.jqplot('graph2', [income2,spend2], {
            title: '',
            animate:true,
            legend:{
                renderer:$.jqplot.EnhancedLegendRenderer,//범례 설정
                show:true,//출력유무
                placement:'inside',//출력위치 설정
                location:'ne',
                marginTop:'15px'
            },
            series: [{
                renderer: $.jqplot.BarRenderer
                ,label:'수입'//막대 이름설정
                , pointLabels: { show: true, stackedValue : true  }
                ,rendererOptions: {
                    animation: {
                        speed: 1500    //animation 설정 시 속도
                    }
                    /* 그림자 */
                    ,shadow: false
                    //shadowDepth: 10, 그림자
                    /* 막대에 관한 라인 */
                    ,showLine: true
                    /* 각각의 막대그래프 램던 색 여부 */
                    ,varyBarColor: false
                    /* 막대 넓이 */
                    ,barWidth: 20      //bar width 설정
                    ,barPadding: 20  //bar padding
                    ,barMargin: 0      //bar간 간격
                }
            },
                {//두번째 그래프 설정
                    renderer: $.jqplot.BarRenderer
                    ,label:'지출'
                    , pointLabels: { show: true, stackedValue : true  }
                    ,rendererOptions: {
                        animation: {
                            speed: 1500    //animation 설정 시 속도
                        }
                        /* 그림자 */
                        ,shadow: false
                        //shadowDepth: 10, 그림자
                        /* 막대에 관한 라인 */
                        ,showLine: true
                        /* 각각의 막대그래프 램던 색 여부 */
                        ,varyBarColor: false
                        /* 막대 넓이 */
                        ,barWidth: 20      //bar width 설정
                        ,barPadding: 20  //bar padding
                        ,barMargin: 0      //bar간 간격
                    }
                }],
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    label: ""
                },
                yaxis: {
                    label: "",

                    tickOptions:{formatString:"%'d"}
                }
            }
        });
    });

</script>
</body>
</html>