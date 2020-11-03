<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="org.json.simple.JSONArray" import="javax.servlet.RequestDispatcher" 
import="org.json.simple.JSONObject" 
    pageEncoding="ISO-8859-1"%>
    

    <%!
    

    
    public JSONArray getJsonObject() {
    	//JSONObject dataSet = new JSONObject();
       // dataSet.put("title", "test json");
       // dataSet.put("url", "www.google.com");
       // dataSet.put("start", "2020-10-02");
      
	
        JSONObject dataSet = new JSONObject();
        dataSet.put("title", "test json");
        dataSet.put("url", "www.google.com");
         dataSet.put("start", "2020-10-02");
       
         JSONObject dataSet2 = new JSONObject();
         dataSet2.put("title", "test json2");
         dataSet2.put("url", "www.google.com");
          dataSet2.put("start", "2020-10-03");
          
          
          JSONObject dataSet3 = new JSONObject();
          dataSet3.put("title", "test json3");
          dataSet3.put("url", "www.google.com");
           dataSet3.put("start", "2020-10-04");
           JSONObject dataSet4 = new JSONObject();
           dataSet4.put("title", "test json4");
           dataSet4.put("url", "www.google.com");
            dataSet4.put("start", "2020-10-05");




        JSONArray properties = new JSONArray();
        properties.add(dataSet);
        properties.add(dataSet2);
        properties.add(dataSet3);
        properties.add(dataSet4);
        
        



        return properties;

    }
%>
    
<!DOCTYPE html>
<head>
<meta charset='utf-8' />

<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<!-- jQuery and JS bundle w/ Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link href='examples/scripts/main.css' rel='stylesheet' />
<script src='examples/scripts/main.js'></script>
<link href="examples/jquery-ui/jquery-ui.css" rel="stylesheet">
<script src="examples/jquery-ui/external/jquery/jquery.js"></script>
<script src="examples/jquery-ui/jquery-ui.js"></script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>
 <div class="container-fluid">
            <div class="row justify-content-md-center"> 
                  <div class="col"> 



                  <button type="button" id="add" class="btn btn-primary btn-lg "> <span class="ui-icon ui-icon-plus" > </span>New Event</button>
                  <div id="EventDiv" class="pt-5">
                    <div class="card" style="width: 26rem;">
                      <div class="card-header">
                        New Event
                      </div>

                      <div class="card-body">
                    
                        <form name="dataSubmit">
                          <!-- <span class="input-group-text" id="inputGroup-sizing-default">Name</span>  --> 
                          



                          <div class="form-group">
                            <label for="exampleInputEmail1"> Event Name</label>
                            <input type="text" class="form-control" id="EventNameID" name="EventName" aria-describedby="emailHelp"/> 
                    
                          </div>

                          <div class="form-group">
                            <label for="exampleInputEmail1"> URL </label>
                            <input type="text"  class="form-control"id="urlID" name="Date"/>
                            Start date Date <input type="text"  class="form-control" id="datepicker">
                            Start time <input type="text"  class="form-control"  id="StartTimeID" name="startTime" />
                          </div>

                     
                  
                           <a  id="SubmitID" href="#" class="btn btn-primary" type="submit">Submit</a>
                        </form>


                        
                      </div>
                    </div>
                  </div>
                </div>
                
    


                <div class="col-9">
                  <div id='calendar'></div>
                </div>
          </div>

  </div>

  <div id="dialog" style="overflow-y: none;">
 
 
      
            <h5>Event name:</h5> <div id="nameOfEvent"></div>
            <h5>Time:</h5> <div id=Time></div> 
            <h5>Link:</h5> <div id=link></div>        
</div>

</body>
</html>
<script>


var data = [];  // data object will need to pass the data from the server 
var myObj  = []; // 

myObj = {         // this is for testing 
  "title":'list that that gets loaded',
  "start":'2020-10-01',
  "url" : 'https://www.google.com/'
};
data.push(myObj); // remove  for testing 

$( document ).ready(function() { // this will auto hide the div for event UI when the DOM is ready to be loaded. 
  $( "#EventDiv").hide();
  $("#dialog").hide();


	
	
	test();
	
});

$( "#add" ).on( "click", function() { // used when button is clicked to show  the add event UI 
    $( "#EventDiv").show(); // shows the div for adding new events 
});

$( function() { // thisis for the date picker 
    $( "#datepicker" ).datepicker( 
      {
        dateFormat: 'yy-mm-dd', //formamt based on how the calader API works 
      }
    );
});


// this is the submit button to update the front end  there will need to be a call that writes to the DB or backend
$( "#SubmitID" ).on( "click", function(){ // this funtion adds new event to the data object 

var eventName  =  $("#EventNameID").val();   // gets the input data
var urlID      = $("#urlID").val();   
var StartTimeID =  $("#StartTimeID").val();   

var start = $( "#datepicker").datepicker( "getDate" ); 

var newRec = {start: start,title: eventName, url: urlID } ; // format for the rec 



data.push(newRec); // adds new json rec  

  $( "#EventDiv").hide(); // hides the UI 
 


 // logic below refreshes the new  events that were added 
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
      initialDate: '2020-10-12',
      editable: true,
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:  data,
        eventClick: function(info) {
          info.jsEvent.preventDefault(); // don't let the browser navigate

          if (info.event.url) {
            //alert('we made it');


           	  $('#nameOfEvent').html(info.event.title);
              $('#link').html('<a class="btn btn-outline-primary btn-sm"  href="' + info.event.url + ' ">Luanch Meeting </a>');
              $('#Time').html(info.event.start);
              $( "#dialog" ).dialog({title: "Event Info", width: 500 });

    
          }
        }
        

    
    });

    
    calendar.render();
});


function test(){
	 data = <%=getJsonObject().toString()%>;

	
	var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialDate: '2020-10-12',
      editable: true,
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: data

       

      ,
            eventClick: function(info) {
          info.jsEvent.preventDefault(); // don't let the browser navigate

          if (info.event.url) {
            //alert('we made it');


     
           	  $('#nameOfEvent').html(info.event.title);
              $('#link').html('<a class="btn btn-outline-primary btn-sm"  href="' + info.event.url + ' ">Luanch Meeting </a>');
              $('#Time').html(info.event.start);
              $( "#dialog" ).dialog({title: "Event Info", width: 500 });

    
          }
        }

    });

    calendar.render();
 }


//myObj.push(data2);
// this is what is used when the DOM  is loaded  aka when the page first loads 



// we need a way of getting the data onload and passing the data back and forth to the  backend amd sever. 

</script>