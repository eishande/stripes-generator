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

    var barHeight = 30;
    //remember to clamp it so it can handle values outside
      //the expected range

    var width = 600,
        height = d3.set(data).size() * barHeight;

    var x = d3.scale.linear()
        .domain([0, d3.max(data)])
        .range([0, width-20]);

    var chart = d3.select("#graph")
        .attr("width", width)   //sets the width of the overall chart
        .attr("height", height); //sets the height of the overall chart

    var bar = chart.selectAll("g")  //what makes them not stack on top of each other
        .data(data)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });

    bar.append("rect")
        .attr("width", width-20)   //sets width of each rect
        .attr("height", barHeight)   //sets height of each rect
        .style("fill", function (d) {
                   return color(d);   //fills with appr. color
               });

    bar.append("text")
        .attr("x", function (d) {
                  return x(d) - 20;
              })
        .attr("y", barHeight/3)
        .attr("dy", ".5em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });

    bar.append("text")
        .attr("x", 590)
        .attr("y", barHeight/2)
        .attr("dy", ".5em")
        .style("fill", "black")
        .text(function(d, i) {
                  return i+1;
                });

          }

});
