// <reference name="MicrosoftAjax.js"/>


function GetNearestSchool(zip,distance) {
   
    Samples.AspNet.AjaxHandler.GetNearestSchool(zip,distance,SucceededCallback);
}

// This is the callback function invoked if the Web service
// succeeded.
// It accepts the result object as a parameter.
function SucceededCallback(result, eventArgs)
{
    // Page element to display feedback.
    //var RsltElem = document.getElementById("NearestSchoolResult");
    //RsltElem.innerHTML = result;
      GetXmlDocument() 
}

// This function calls the Web service method 
// that returns an XmlDocument type.  
function GetXmlDocument() 
{

    Samples.AspNet.AjaxHandler.GetXmlDocument(
        SucceededCallbackWithContext, FailedCallback,
        "XmlDocument")
}


// This is the callback function invoked if the Web service
// succeeded.
// It accepts the result object, the user context, and the 
// calling method name as parameters.
function SucceededCallbackWithContext(result, userContext, methodName)
{
//alert("success call back");
//alert("result:-"+result+"usercontext"+userContext+"method name"+ methodName)
    var output;
    
    var rowdata;
    
    
    // Page element to display feedback.
    //var RsltElem = document.getElementById("NearestSchoolResult");
    var RsltElem = document.getElementById("NearestSchoolResult");
    
    var readResult;
    if (userContext == "XmlDocument")
	{
	//alert("success call back in if");
	
	    if (document.all) 
	    {
	      readResult =result.documentElement.firstChild.text;
	    }
		else
		{
		     // this variable stores the code of the html table
   var html_tab = '<table id="id_tabel" align="center" width="99%"><tr><th></th><th Style="display: none">schoolId</th><th>school name</th><th>distance</th><th Style="display: none">lat</th><th Style="display: none">longitude</th></tr>';
   var xml_dom = result;           // calls the "getXML_file()" function with the name of the XML file
   
   var arr_sites = xml_dom.getElementsByTagName('Records');         // gets an Array with all "site" tags
  if(document.getElementById("CountSchool")!=null)
  {
     document.getElementById("CountSchool").innerHTML=arr_sites.length;
  }
  
  // traverses the "arr_sites" array
  for(var i=0; i<arr_sites.length; i++) {
  
  
    var site_schoolID = arr_sites[i].getElementsByTagName('schoolId')[0].childNodes[0].nodeValue;;         // gets the value of 'schoolId' element of current "site" tag

    // gets the value of first child-node of first 'schoolName' element of current "site" tag
    var site_SchoolName = arr_sites[i].getElementsByTagName('schoolName')[0].childNodes[0].nodeValue;

    // gets the value of first child-node of first 'Distance' element of current "site" tag
    var site_Distance = arr_sites[i].getElementsByTagName('Distance')[0].childNodes[0].nodeValue;
    
    // gets the value of first child-node of first 'lat' element of current "site" tag
    var site_lat = arr_sites[i].getElementsByTagName('lat')[0].childNodes[0].nodeValue;

    // gets the value of first child-node of first 'longitude' element of current "site" tag
    var site_long = arr_sites[i].getElementsByTagName('longitude')[0].childNodes[0].nodeValue;


    // adds the values in the html table
    html_tab += '<tr><td><input id="chkChoice_' + i + '" onclick="javascript:SchholInMyQuote(this);" type="checkbox"  /></td><td Style="display: none" id="schoolId_' + i + '">' + site_schoolID + '</td><td  id="schoolName_' + i + '">' + site_SchoolName + '</td><td>' + site_Distance + '</td><td  id="lat_' + i + '"  Style="display: none">' + site_lat + '</td><td id="long_' + i + '" Style="display: none">' + site_long + '</td></tr>';
    }
    html_tab += '</table>';// close the code for html tabel

           // returns the table
              RsltElem.innerHTML = html_tab;
        }
		   
	}
}






// It accepts the error object as a parameter.
function FailedCallback(error)
{
    // Display the error.    
    var RsltElem = document.getElementById("NearestSchoolResult");
    RsltElem.innerHTML = 
    "Service Error: " + error.get_message();
}


if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();

