<div class="container">

  <% if @listing.avatars?%>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <%for i in 0..@listing.avatars.count - 1 %>
          <li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
          <%end%>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <% @listing.avatars.each_with_index do |avatar, index|%>
          <div class="item <%= 'active' if index == 0%>">
            <%= image_tag(avatar.url, size: "200") %>
          </div>
          <%end%>
      </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>


<div id="owl-carousel">
 <% @listing.avatars.each do |x|%>
<div class="item"><%= image_tag(x.url, size:"200")%></div>
<% end %> 
</div>
