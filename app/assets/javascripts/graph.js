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
      $('#color1').minicolors().minicolors('value', data.colors[0]);
      $('#color2').minicolors().minicolors('value', data.colors[1]);
      $('#color3').minicolors().minicolors('value', data.colors[2]);
      $('#color4').minicolors().minicolors('value', data.colors[3]);
      $('#color5').minicolors().minicolors('value', data.colors[4]);

      draw(data.data, data.colors);

    },
    error: function(result) {
      console.log("Error");
    }
  });

  function draw(data, colors) {
    var buckets = d3.scale.linear().domain(d3.extent(data)).nice();
    var min = d3.min(buckets.domain());
    var max = d3.max(buckets.domain());
    var step = (max - min) / 5;
    var ticks = d3.range(min + step, max, step);

    var color = d3.scale.threshold()
        .domain(ticks)
        .range(colors);
    var barHeight = 30;

    var width = 600,
        height = d3.set(data).size() * barHeight;

    var x = d3.scale.linear()
        .domain([d3.min(data), d3.max(data)])
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
        .attr("width", width-30)   //sets width of each rect
        .attr("height", barHeight)   //sets height of each rect
        .style("fill", function (d) {
                   return color(d);   //fills with appr. color
               });

    bar.append("text")
        .attr("x", function (d) {
                  return x(d);
              })
        .attr("y", barHeight/3)
        .attr("dy", ".5em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });

    bar.append("text")
        .attr("x", 580)
        .attr("y", barHeight/2)
        .attr("dy", ".5em")
        .style("fill", "black")
        .text(function(d, i) {
                  return i+1;
                });

          }

});
