<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-06-30
  Time: 오후 5:41
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu_sh.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body style="overflow-x:hidden; overflow-y:auto;">



<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<div class="container">

    <br><br>
    <div align="center"><span style="font-size: 40px" id="monthlyReportTitle"><strong></strong></span></div>
    <br>

    <div>

        <div align="center" style="margin-top: 50px"><!-- 달력 -->

            <input type="button" value="◀" id="monthPrev" style="border: none; background-color: white;">
            <input type="text" id="monthOutput" readonly="readonly" class="form_month" data-date="" data-date-format="yyyy년 MM" data-link-field="dtp_input3" data-link-format="yyyy MM" style="text-align: center;border: none;" placeholder="월 선택" onchange="isChanged()">
            <input type="button" value="▶" id="monthNext"style="border: none; background-color: white;">
        </div>
        <div align="Right" style="margin-right: 60px;">
            <input id="btn_stick" class="btn btn-sm btn-outline-primary active" type="button" name="" value="막대형" onclick="stickGraph()">
            <input id="btn_donut" class="btn btn-sm btn-outline-primary " type="button" name="" value="파이형" onclick="donutGraph()"></div><!-- 형태선택 버튼 -->
        <br>
        <div class="ml-5" id="graph1" style="width: 35%; height: 500px; float: left;"></div>
        <div class="mr-5" id="graph2" style="width: 55%; height: 500px; float: right;"></div>
        <div style="clear: both;"></div>
        <div style="width: 1173px;">
            <table class="table" style="text-align: center; table-layout: fixed;">
                <thead>
                <tr>
                    <th scope="col">날짜</th>
                    <th scope="col">사용내역(태그)</th>
                    <th scope="col">지출내역</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td scope="row">2018.06.01</td>
                    <td>커피</td>
                    <td>100,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.04</td>
                    <td>회식</td>
                    <td>500,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>비품구매</td>
                    <td>450,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>노래방</td>
                    <td>230,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>MT</td>
                    <td>57,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>뒷풀이</td>
                    <td>73000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>운동회</td>
                    <td>25,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>간식비</td>
                    <td>30,000원</td>
                </tr>
                </tbody>
            </table>
        </div>
        <br><br>
        <table align="Right" style="margin-right: 60px;">
            <tr>
                <td style="text-align: center;font-size: 30px"><strong>총 지출액 : </strong></td><td style="text-align: center; font-size: 30px">1,234,567원</td>
            </tr>
        </table>
        <br><br><br>

    </div>
    <br>
    <div align="Right" style="margin-right: 60px;">
        <input type="button" name="" value="보고서 출력" onClick="fnPrint()">
    </div>
    <br><br>

    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>



    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- 라인 그래프 출력을 위한 파일 include -->
    <link class="include" rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.css" />
    <link class="include" rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.js"></script>
    <!-- 막대 그래프 출력을 위한 파일 include -->
    <script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.barRenderer.min.js"></script>
    <!-- 원형 그래프 출력을 위한 파일 include -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.pieRenderer.min.js"></script>
    <!-- 도넛 그래프 출력을 위한 파일 include -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.donutRenderer.min.js"></script>
    <!-- 그래프 수치 표시를 위한 include -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.pointLabels.min.js"></script>
    <!-- 범례 표시 위한 include -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
    <!--  -->
    <script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <!-- 달력 출력을 위한 include -->
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            $('.menuTab').removeClass("active");
            $("#btn_report").addClass("active");
        });

        var fnPrint = function() {
            window.print();
        };
        var isChanged = function(){
            var mm = $("#monthOutput").val();
            var yearMonth = $("#monthOutput").val();
            var tmp = yearMonth.replace(/[^0-9]/g,'');
            var year = Number(tmp.substr(0,4));
            var month = Number(tmp.substr(4,6));
            $("#monthOutput").val(year+"년"+month+"월");
            $("#monthlyReportTitle").html("<strong>"+year+"년 "+month+"월 보고서</strong>");
        };
        $(document).on("ready",function(){
            var today = new Date();
            var yyyy = today.getFullYear();
            var mm = today.getMonth()+1;
            var dd = today.getDate();
            $("#monthlyReportTitle").html("<strong>"+yyyy+"년 "+mm+"월 보고서</strong>");
            $("#monthOutput").val(yyyy+"년 "+mm+"월");
            $('.form_month').datetimepicker({
                language:  'ko',
                weekStart: 1,
                todayBtn:  1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 3,
                minView: 3,
                forceParse: 0
            });
            $('#monthPrev').on("click",function(){
                var yearMonth = $("#monthOutput").val();
                var tmp = yearMonth.replace(/[^0-9]/g,'');
                var year = Number(tmp.substr(0,4));
                var month = Number(tmp.substr(4,6));
                if (month <= 1) {
                    month = 12;
                    year -= 1;
                }else{
                    month -= 1;
                }
                $("#monthOutput").val(year+"년"+month+"월");
                $("#monthlyReportTitle").html("<strong>"+year+"년 "+month+"월 보고서</strong>");
            });
            $('#monthNext').on("click",function(){
                var yearMonth = $("#monthOutput").val();
                var tmp = yearMonth.replace(/[^0-9]/g,'');
                var year = Number(tmp.substr(0,4));
                var month = Number(tmp.substr(4,6));
                if (month >= 12) {
                    month = 1;
                    year += 1;
                }else{
                    month += 1;
                }
                $("#monthOutput").val(year+"년"+month+"월");
                $("#monthlyReportTitle").html("<strong>"+year+"년 "+month+"월 보고서</strong>");
            });
        });


        $(function() {
            $.jqplot('graph1', [[['1월',1000000],['2월',5000000],['3월',4500000],['4월',2300000],['5월',3500000],['6월',1400000],['7월',4200000],['8월',6300000],['9월',7200000],['10월',1300000],['11월',5800000],['12월',6400000]]],
                {title: '연간 지출',
                    animate:true,
                    // seriesColors:['#ff0000','#0000ff'],
                    series: [{//첫번째 그래프 설정
                        renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                            ,barPadding: 0  //bar padding
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

            $.jqplot('graph2', [[['커피',100000],['회식',500000],['비품구매',450000],['노래방',230000],['MT',57000],['뒷풀이',73000],['운동회',25000],['간식비',30000]]], {
                title: '6월 총 지출',
                animate:true,
                // seriesColors:['#ff0000','#0000ff'],
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                        ,barPadding: 0  //bar padding
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
        });
        var stickGraph = function(){
            $('#graph1').children().remove();
            $('#graph2').children().remove();
            $("#btn_stick").addClass('active');
            $("#btn_donut").removeClass('active');
            $.jqplot('graph1', [[['1월',1000000],['2월',5000000],['3월',4500000],['4월',2300000],['5월',3500000],['6월',1400000],['7월',4200000],['8월',6300000],['9월',7200000],['10월',1300000],['11월',5800000],['12월',6400000]]],
                {title: '연간 지출',
                    animate:true,
                    // seriesColors:['#ff0000','#0000ff'],
                    series: [{//첫번째 그래프 설정
                        renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                            ,barPadding: 0  //bar padding
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

            $.jqplot('graph2', [[['커피',100000],['회식',500000],['비품구매',450000],['노래방',230000],['MT',57000],['뒷풀이',73000],['운동회',25000],['간식비',30000]]], {
                title: '6월 총 지출',
                animate:true,
                // seriesColors:['#ff0000','#0000ff'],
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                        ,barPadding: 0  //bar padding
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
        };

        var donutGraph = function(){
            $('#graph1').children().remove();
            $('#graph2').children().remove();
            $("#btn_donut").addClass('active');
            $("#btn_stick").removeClass('active');
            $.jqplot('graph1', [[['1월',1000000],['2월',5000000],['3월',4500000],['4월',2300000],['5월',3500000],['6월',1400000],['7월',4200000],['8월',6300000],['9월',7200000],['10월',1300000],['11월',5800000],['12월',6400000]]], {
                animate: true, animateReplot: true,
                title:'연간 지출',
                // seriesColors:['#ff0000','#0000ff'],
                legend:{
                    renderer:$.jqplot.EnhancedLegendRenderer,//범례 설정
                    show:true,//출력유무
                    placement:'inside',//출력위치 설정
                    location:'nw',
                    marginTop:'15px'
                },
                seriesDefaults: {
                    // make this a donut chart.
                    renderer:$.jqplot.DonutRenderer,
                    rendererOptions:{
                        // Donut's can be cut into slices like pies.
                        sliceMargin: 3,
                        // Pies and donuts can start at any arbitrary angle.
                        startAngle: -90,
                        showDataLabels: true,
                        // By default, data labels show the percentage of the donut/pie.
                        // You can show the data 'value' or data 'label' instead.
                        dataLabels: 'value',
                        // "totalLabel=true" uses the centre of the donut for the total amount
                        totalLabel: true,
                        animation: {
                            show:true,
                            speed: 1500    //animation 설정 시 속도
                        }
                    }
                }
            });
            $.jqplot('graph2', [[['커피',100000],['회식',500000],['비품구매',450000],['노래방',230000],['MT',57000],['뒷풀이',73000],['운동회',25000],['간식비',30000]]], {
                animate: true, animateReplot: true,
                title:'6월 총 지출',
                // seriesColors:['#ff0000','#0000ff'],
                legend:{
                    renderer:$.jqplot.EnhancedLegendRenderer,//범례 설정
                    show:true,//출력유무
                    placement:'inside',//출력위치 설정
                    location:'se',
                    marginTop:'15px'
                },
                seriesDefaults: {
                    // make this a donut chart.
                    renderer:$.jqplot.DonutRenderer,
                    rendererOptions:{
                        // Donut's can be cut into slices like pies.
                        sliceMargin: 3,
                        // Pies and donuts can start at any arbitrary angle.
                        startAngle: -90,
                        showDataLabels: true,
                        // By default, data labels show the percentage of the donut/pie.
                        // You can show the data 'value' or data 'label' instead.
                        dataLabels: 'value',
                        // "totalLabel=true" uses the centre of the donut for the total amount
                        totalLabel: true,
                        animation: {
                            show:true,
                            speed: 1500    //animation 설정 시 속도
                        }
                    }
                }
            });
        };


    </script>
</body>
</html>