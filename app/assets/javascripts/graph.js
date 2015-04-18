//= require jquery
//= require jquery_ujs
//= require foundation

$(function() {
  $.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: window.location.pathname,
    dataType: 'json',
    success: function(data) {
      //  { data => [45,32,45,21], colors => ["#452, #EE4, #A3D"]}
      draw(data.data, data.colors);
    },
    error: function(result) {
      console.log("Error");
    }
  });

  function draw(data, colors) {
    var buckets = d3.scale.linear().domain(d3.extent(data)).nice();
    var ticks = buckets.ticks(5);
    var color = d3.scale.threshold()
        .domain(ticks)
        .range(colors);

    //remember to clamp it so it can handle values outside
      //the expected range

    var width = 600,
        height = 800;

    var x = d3.scale.linear()
        .domain([0, d3.max(data)])
        .range([0, width]);
  
    var chart = d3.select("#graph")
        .attr("width", width)   //sets the width of the overall chart
        .attr("height", height); //sets the height of the overall chart

    var bar = chart.selectAll("g")  //what makes them not stack on top of each other
        .data(data)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * 20 + ")";
              });

    bar.append("rect")
        .attr("width", width)   //sets width of each rect
        .attr("height", 20)   //sets height of each rect
        .style("fill", function (d) {
                   return color(d);   //fills with appr. color
               });

    bar.append("text")
        .attr("x", function (d) {
                  return x(d) - 10;
              })
        .attr("y", 10)
        .attr("dy", ".35em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });
  }
});
