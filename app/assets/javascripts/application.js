// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(function() {
  d3.select("body").append("p").text("New paragraph!");

  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'graph/data',
       dataType: 'json',
       success: function (data) {
           draw(data);
       },
       error: function (result) {
           console.log("Error");
       }
       });

  function draw(data) {
    var color = d3.scale.category10();

    var width = 600,
        height = 800;

    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data)]);

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
