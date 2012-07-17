<%@ Control Language="C#" Inherits="Philip.Modules.SSM_Quote_Building.EditSSM_Quote_Building"
    CodeFile="EditSSM_Quote_Building.ascx.cs" AutoEventWireup="true" %>
<style type="text/css">
    .stepheading
    {
        font-size: 12pt;
        text-align: left;
    }
    .location
    {
        font-size: 11pt;
        color: #A91D24;
        text-align: left;
    }
    .setlayout
    {
        padding-bottom: 2px;
        padding-top: 10px;
        padding-left: 5px;
        padding-right: 5px;
    }
    .style1
    {
        font-size: 11pt;
        color: #A91D24;
        height: 38px;
    }
    #Button1
    {
        width: 29px;
    }
    .googlemap
    {
        width: 96%;
    }
    .style3
    {
        font-size: xx-small;
        text-align: left;
    }
</style>
<%--add gmap api--%>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markermanager/src/markermanager.js"></script>

<script type="text/javascript">


    //decalre and initialize varibale.
    var map;
    var marker1;
    var marker = new google.maps.Marker();
    var myLocMarker = new google.maps.Marker();
    var nearestSchoolMarker = new google.maps.Marker();
    var geocoder;
    var cicleCenter;
    var bounds = new google.maps.LatLngBounds();
    var gmapMarkerForEmail;


    //to initialize gmap on page load
    $(document).ready(function() {
        return initialize();
    });

    function initialize() {
      
        //set initial gmap center to its centroid
        var cenLatLong = new google.maps.LatLng(44.98811302615805, -93.27392578125);
        var myOptions = {
            center: cenLatLong,
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        //add map on div
        map = new google.maps.Map(document.getElementById("SSSMMap"), myOptions);
    }

    //this function call when any click evnet fire on gird row 
    //get lat log for zipcode/complete address and put marker on it.
    function codeAddress(completeAddress) {

        var addPart = completeAddress.split(',');
        if (document.getElementById("<%=hdnSelRowZip.ClientID%>") != null) {
            document.getElementById("<%=hdnSelRowZip.ClientID%>").value = addPart[3];
        }
        geocoder = new google.maps.Geocoder();
        var completeAddress = completeAddress;


        geocoder.geocode({ 'address': completeAddress }, function(results, status) {

            //chekc result status 
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                    map: map,
                    icon: "http://maps.google.com/mapfiles/ms/micons/blue-dot.png",
                    position: results[0].geometry.location
                });

                var overlayLatLong = results[0].geometry.location;

                //create circle overlay on gmap
                var addressPart = completeAddress.split(',');
                AddCircleOverlay(overlayLatLong, addressPart[0]);
                AllNearestSchoolMarker();
               
                //put maker on all mylocation grid investor location
                mutipleMarker();
            }
            else {
                //alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }

    //call when mylocation grid add button click
    function codeAddressOnRowAdd(controlID) {
        var address;
        var city;
        var state;
        var zip;

        //get all address info form footer of grid 
        if (document.getElementById(controlID.replace("lbtnAdd", "txtAddress")) != null)
            address = document.getElementById(controlID.replace("lbtnAdd", "txtAddress")).value;
        if (document.getElementById(controlID.replace("lbtnAdd", "txtCity")) != null)
            city = document.getElementById(controlID.replace("lbtnAdd", "txtCity")).value;
        if (document.getElementById(controlID.replace("lbtnAdd", "txtState")) != null)
            state = document.getElementById(controlID.replace("lbtnAdd", "txtState")).value;
        if (document.getElementById(controlID.replace("lbtnAdd", "txtZip")) != null)
            zip = document.getElementById(controlID.replace("lbtnAdd", "txtZip")).value;

        //pass all value to code address function
        codeAddress(address + "," + city + "," + state + "," + zip);
    }

    function AddCircleOverlay(overlayCenter, completeAddress) {
        
        //---------------initilize map to remove old marker--------------//
        initialize();
        
        //------------get selected row lat long and point this on circle----------//
        var centerMarker = new google.maps.LatLng(overlayCenter.lat(), overlayCenter.lng());
        var ovarlayMark = new google.maps.Marker({
        map: map,
        icon: "http://maps.google.com/mapfiles/ms/micons/blue-dot.png",
            position: centerMarker,
            title: "Circle Overlay"
            //icon: "/SSM_DNN/DesktopModules/SSM_Quote_Building/Image/red.png"
        });

        //--------------Add circle overlay and bind to marker----------------//
        var circle = new google.maps.Circle({
            map: map,
            radius: 8046.5,    // 5 miles in metres
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#FF0000",
            fillOpacity: 0.35
        });
        //-----------bind circle on gmap-----------//
        circle.bindTo('center', ovarlayMark, 'position');

        //-------To fit circle on map--------------//
        bounds = circle.getBounds();
        map.setCenter(bounds.getCenter());
        uniqueMarkerListForMyLoc(overlayCenter, completeAddress);
    }


    //--------------This function is used to prepare list of all lat long which get by zip code for each enter new location and stote this list ot hdn fild--------//     
    function uniqueMarkerListForMyLoc(overlayCenter, investorAddress) {
        // function uniqueMarkerListForMyLoc(overlayCenter) {
        alert("uniquemarker");
        var myLocLatitude;
        var myLocLongitude;
        var flag = 0;
        

        //check hidden field is available (this field hava all investor location lat long)
        if (document.getElementById("<%=hdnMyLoctionLat.ClientID%>") != null && document.getElementById("<%=hdnMyLoctionLong.ClientID%>") != null || document.getElementById("<%=hdbInvestroAddress.ClientID%>") != null) {
            
            //get value from hidden field 
            myLocLatitude = document.getElementById("<%=hdnMyLoctionLat.ClientID%>");
            myLocLongitude = document.getElementById("<%=hdnMyLoctionLong.ClientID%>");
            markAddress = document.getElementById("<%=hdbInvestroAddress.ClientID%>")
            //check for empty hiddend field (when first entry is done in hidden field)  
            if (myLocLatitude.value == "" && myLocLongitude.value == "") {

                myLocLatitude.value = overlayCenter.lat() + ",";
                myLocLongitude.value = overlayCenter.lng() + ",";
                markAddress.value = investorAddress + ",";
                alert(markAddress.value);

            }
            else {

                //read presave value for uniqure chekc.
                var lat_Array = myLocLatitude.value.split(',');
                var long_Array = myLocLongitude.value.split(',');

                //when hidden field already have an value 
                for (i = 0; i < lat_Array.length - 1; i++) {

                    //check for unique value
                    if (overlayCenter.lat() == lat_Array[i] && overlayCenter.lng() == long_Array[i]) {
                        flag = 1;
                    }
                }
                //flag zero means value is unique and add to hidden field by comma sepretor 
                if (flag == 0) {
                    myLocLatitude.value += overlayCenter.lat() + ",";
                    myLocLongitude.value += overlayCenter.lng() + ",";
                    markAddress.value += investorAddress + ",";
                    
                }

            }
        }
    }

    //function for delete marker form gmap for investro location when row delete form grid view
    function RemoveInvMarkerOnDelete() {

        try {


            var myLocLatitude;
            var myLocLongitude;
            var markAddress;
            var latLong;

            if (document.getElementById("<%=hdnMyLoctionLat.ClientID%>") != null && document.getElementById("<%=hdnMyLoctionLong.ClientID%>") != null || document.getElementById("<%=hdbInvestroAddress.ClientID%>") != null) {
                //get value from hidden field 
                myLocLatitude = document.getElementById("<%=hdnMyLoctionLat.ClientID%>");
                myLocLongitude = document.getElementById("<%=hdnMyLoctionLong.ClientID%>");
                markAddress = document.getElementById("<%=hdbInvestroAddress.ClientID%>")
                myLocLatitude.value = "";
                myLocLongitude.value = "";
                markAddress.value = "";
            }

            if (document.getElementById("<%=dgMyLocation.ClientID%>") != null) {
                var tabl = document.getElementById("<%=dgMyLocation.ClientID%>");
                if (tabl.rows.length > 0) {
                    var l = tabl.rows.length;
                    var i = 0;
                    for (i = 1; i < l - 1; i++) {
                        var tr = tabl.rows[i];
                        zipCode = tr.cells[0].innerHTML.trim() + "," + tr.cells[1].innerHTML.trim() + "," + tr.cells[2].innerHTML.trim() + "," + tr.cells[3].innerHTML.trim();
                        var investorAddress = tr.cells[0].innerHTML;
                        markAddress.value += investorAddress + ",";
                        //find latlong for given zipcode
                        geocoder = new google.maps.Geocoder();
                        var completeAddress = zipCode;
                        geocoder.geocode({ 'address': completeAddress }, function(results, status) {
                            //chekc result status 
                            if (status == google.maps.GeocoderStatus.OK) {
                                var LatLong = results[0].geometry.location;
                                myLocLatitude.value += LatLong.lat() + ",";
                                myLocLongitude.value += LatLong.lng() + ",";
                                
                            }
                        });
                    }
                }
            }

        }
        catch (err) {
        }
        
    }


    function getLatLongFromGeocode(invAddress) {
        //find latlong for given zipcode
        geocoder = new google.maps.Geocoder();
        var completeAddress = invAddress;
        geocoder.geocode({ 'address': completeAddress }, function(results, status) {
            //chekc result status 
            if (status == google.maps.GeocoderStatus.OK) {
                var LatLong = results[0].geometry.location;
            }
        });
        return LatLong;
    }

    //---------Read all my location lat long for hidden field and put into map---------//
    function mutipleMarker() {
        var myLocLatitude;
        var myLocLongitude;
        var infowindow;
        var ltlng = [];
        var markerAdd = [];

        
        
        //------read lat long form hidden field-----//
        //if (document.getElementById("<%=hdnMyLoctionLat.ClientID%>") != null && document.getElementById("<%=hdnMyLoctionLong.ClientID%>") != null || document.getElementById("<%=hdbInvestroAddress.ClientID%>") != null) {
        if (document.getElementById("<%=hdnMyLoctionLat.ClientID%>") != null && document.getElementById("<%=hdnMyLoctionLong.ClientID%>") != null) {

            myLocLatitude = document.getElementById("<%=hdnMyLoctionLat.ClientID%>");
            myLocLongitude = document.getElementById("<%=hdnMyLoctionLong.ClientID%>");
            markAddress = document.getElementById("<%=hdbInvestroAddress.ClientID%>")

            //do separate each lat long.
            var lat_Array = myLocLatitude.value.split(',');
            var long_Array = myLocLongitude.value.split(',');
            var invLoc = markAddress.value.split(',');

            gmapMarkerForEmail = "";
            //create lat long array that is farther process to put marker 
            for (i = 0; i < lat_Array.length - 1; i++) {

                ltlng.push(new google.maps.LatLng(lat_Array[i], long_Array[i]));
                markerAdd.push(invLoc[i]);
                //(IMPORTANT!)      //this code is used to prepare url for static gamp that is send with email.
                gmapMarkerForEmail += lat_Array[i] + "," + long_Array[i] + "|";
                document.getElementById("<%=hdnAllGmapMark.ClientID%>").value = gmapMarkerForEmail;

            }
        }

        //Process lat long array and put marker on map
        for (var i = 0; i <= ltlng.length; i++) {
            myLocMarker = new google.maps.Marker({
                map: map,
                icon: "http://maps.google.com/mapfiles/ms/micons/blue-dot.png", //"/SSM_DNN/DesktopModules/SSM_Quote_Building/Image/MyLocation.png", //"http://maps.google.com/mapfiles/ms/micons/blue-dot.png",
                title: markerAdd[i],
                //title:'abc',
                position: ltlng[i]
            });

            (function(i, myLocMarker) {

                //perform click to add marker on it
                google.maps.event.addListener(myLocMarker, 'click', function() {

                    if (!infowindow) {
                        infowindow = new google.maps.InfoWindow();
                    }

                    //set info window for marker
                    infowindow.setContent(markerAdd[i]);
                    //infowindow.setContent('abc');
                    infowindow.open(map, myLocMarker);

                });

            })(i, myLocMarker);
        }
    }

    //To create and put marker on all nearest school lat long.
    function AllNearestSchoolMarker() {

        try {
            //decalre an initallize variable  
            var nearestSchLat;
            var nearestSchLong;
            var ltlngNearestSchool = []; //lat long arrray
            var checkBoxArr = [];  //used to store status of check box to show diffrent immage according to it
            var schoolN = []; //used to store school name to show name of school on marker click on map.
            var infowindow;
            var tbl_ID;

            var mylocRow = countMyLocRow(); //to count row in my location grid

            //get table id for hidden field
            if (document.getElementById("<%=hdnTableID.ClientID%>") != null) {

                tbl_ID = document.getElementById("<%=hdnTableID.ClientID%>").value;

                //loop to create id of each table in recommendd school list( exp:id_tabel_1 )
                for (k = 1; k <= mylocRow - 2; k++) {

                    if (tbl_ID + "_" + k != "") {
                        //alert(tbl_ID + "_" + k);
                        var tabl = document.getElementById(tbl_ID + "_" + k);
                        //alert("table"+tabl);
                        if (tabl.rows.length > 0) {
                            var l = tabl.rows.length;
                            var i = 0;
                            var s = "";
                            for (i = 1; i < l; i++) {
                                var tr = tabl.rows[i];
                                var newVal = i - 1;
                                var chkStatus = document.getElementById("chkChoice_" + k + newVal).checked;
                                var currSchoolName = document.getElementById("schoolName_" + k + newVal).innerHTML;
                                //create arry of checkBoxArr  status
                                checkBoxArr.push(chkStatus);

                                //create array of school name
                                schoolN.push(currSchoolName);

                                //create array of all nearest school lat long
                                ltlngNearestSchool.push(new google.maps.LatLng(tr.cells[4].innerHTML, tr.cells[5].innerHTML));
                            }
                        }
                    }
                }

            }

            //read latlong array and put marker on it each location.
            if (ltlngNearestSchool.length > 0) {
                var markerPath = "";
                for (var i = 0; i <= ltlngNearestSchool.length; i++) {

                    // set different images according to check box staus 
                    if (checkBoxArr[i] == true) {
                        markerPath = "/SSM_DNN/DesktopModules/SSM_Quote_Building/Image/redg.png";
                        //alert(schoolN[i]+"  =red");
                    }
                    if (checkBoxArr[i] == false) {
                        markerPath = "/SSM_DNN/DesktopModules/SSM_Quote_Building/Image/back&white.png";
                        //alert(schoolN[i]+"  =black");
                    }

                    //create makerker object
                    nearestSchoolMarker = new google.maps.Marker({
                        map: map,
                        icon: markerPath,
                        title: schoolN[i],
                        position: ltlngNearestSchool[i]
                    });

                    //click on each marker location and add maker on it
                    (function(i, nearestSchoolMarker) {

                        google.maps.event.addListener(nearestSchoolMarker, 'click', function() {

                            if (!infowindow) {
                                infowindow = new google.maps.InfoWindow();
                            }
                            //create infor window to
                            infowindow.setContent(schoolN[i]);

                            infowindow.open(map, nearestSchoolMarker);

                        });

                    })(i, nearestSchoolMarker);
                }
            }
        
        
        }
        catch (err) {
        }
        
    }



    //To count total no of row in grid.
    function countMyLocRow() {
        var l;
        if (document.getElementById("<%=dgMyLocation.ClientID%>") != null) {
            var tabl = document.getElementById("<%=dgMyLocation.ClientID%>");
            if (tabl.rows.length > 0) {
                l = tabl.rows.length;
            }
        }
        return l;
    }

    function chkInnerHTML() {
        var findTable = document.getElementById("UseForDelQuote").innerHTML;
        alert(document.getElementById(findTable).innerHTML);

    }
   
</script>

<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="map_content">
            <%--<asp:UpdatePanel ID="pnlUpdateLoc" runat="server">
         <ContentTemplate>
--%>
            <%--</ContentTemplate>
           </asp:UpdatePanel>--%>
            <table border="0" cellpadding="2" cellspacing="0" class="googlemap">
                <tr>
                    <td class="stepheading" colspan="8">
                        <b>Step 1:Pick Schools &gt;</b> Step 2: Campaign Details &gt; Step 3: Quote Details
                    </td>
                </tr>
                <tr>
                    <td class="style1" colspan="3">
                        <br />
                        <br />
                    </td>
                    <td class="style1" colspan="4">
                        <br />
                        <br />
                    </td>
                    <td class="style1">
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="location" colspan="3">
                        <b>my locations</b>
                        <hr />
                        <br />
                    </td>
                    <td class="location" colspan="5">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="location" colspan="3">
                        &nbsp;
                    </td>
                    <td class="location" colspan="5">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div id="investorLoc" style="height: auto; width: 96%;">
                                    <asp:DataGrid ID="dgMyLocation" Width="98%" runat="server" AutoGenerateColumns="False"
                                        ShowFooter="True" HorizontalAlign="Center" OnItemCommand="AddInvestorLoc" OnDeleteCommand="DelInvestorLoc"
                                        OnItemDataBound="dgMyLocation_ItemDataBound" OnPageIndexChanged="dgMyLocation_PageIndexChanged"
                                        OnSelectedIndexChanged="dgMyLocation_SelectedIndexChanged" DataKeyField="Id"
                                        OnItemCreated="dgMyLocation_ItemCreated">
                                        <FooterStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                        <SelectedItemStyle CssClass="SelectedItemStyle" />
                                        <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" BackColor="#869BC3" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="Name" Visible="false">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "Name")%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" Width="90%" ID="txtName" MaxLength="50" Text='' />
                                                </FooterTemplate>
                                                <FooterStyle CssClass="setlayout" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Address">
                                                <ItemTemplate>
                                                    <%#DataBinder.Eval(Container.DataItem,"Address" )%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" Width="90%" ID="txtAddress" MaxLength="50" Text='' />
                                                </FooterTemplate>
                                                <FooterStyle CssClass="setlayout" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="City">
                                                <ItemTemplate>
                                                    <%#DataBinder.Eval(Container.DataItem,"City")%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="15%" />
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" Width="90%" ID="txtCity" MaxLength="20" Text='' />
                                                </FooterTemplate>
                                                <FooterStyle CssClass="setlayout" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="State">
                                                <ItemTemplate>
                                                    <%#DataBinder.Eval(Container.DataItem,"State")%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="10%" />
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" Width="50%" ID="txtState" MaxLength="2" Text='' />
                                                </FooterTemplate>
                                                <FooterStyle CssClass="setlayout" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Zip">
                                                <ItemTemplate>
                                                    <%#DataBinder.Eval(Container.DataItem,"Zip")%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="10%" />
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" ID="txtZip" MaxLength="5" Text='' Width="50%" onkeydown="javascript:return addRowOnEnterClick(event,this.id);" />
                                                    <asp:RequiredFieldValidator ID="rfvZip_Code" runat="server" ErrorMessage="*" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtZip"
                                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                                </FooterTemplate>
                                                <FooterStyle CssClass="setlayout" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Nearest School">
                                                <ItemTemplate>
                                                    <%#DataBinder.Eval(Container.DataItem, "NearestSchoolList")%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="10%" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Recommended Schools">
                                                <ItemTemplate>
                                                    <%#DataBinder.Eval(Container.DataItem, "RecommendedSchoolList")%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="20%" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="">
                                                <ItemTemplate>
                                                    <%-- <a href="javascript:__doPostBack('_ctl0$dgRequests$_ctl4$_ctl0','')">Select</a>--%>
                                                    <asp:ImageButton ID="Image1Delete" CausesValidation="false" ToolTip="Delete" AlternateText="Delete"
                                                        CommandName="Delete" BorderStyle="None" runat="server" ImageUrl="~/DesktopModules/SSM_Quote_Building/Image/delete.png"
                                                        Height="19" Width="19" />
                                                    <%-- OnClientClick="javascript:return confirm('Are you sure, you want to delete the record?');"--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="lbtnAdd" runat="Server" CommandName="addLocation" OnClientClick="javascript:codeAddressOnRowAdd(this.id);">
                                                        <asp:Image ID="Image1Add" ToolTip="Add" AlternateText="Add" BorderStyle="None" runat="server"
                                                            ImageUrl="~/DesktopModules/SSM_Quote_Building/Image/plus.png" Height="19" Width="19" />
                                                    </asp:LinkButton>
                                                </FooterTemplate>
                                                <FooterStyle CssClass="setlayout" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="" Visible="false">
                                                <ItemTemplate>
                                                    <%-- <a href="javascript:__doPostBack('_ctl0$dgRequests$_ctl4$_ctl0','')">Select</a>--%>
                                                    <asp:LinkButton ID="lbtnSelect" runat="server" CausesValidation="False" CommandName="Select">
                                                        <asp:Image ID="Image1Select" ToolTip="Select" AlternateText="Select" BorderStyle="None"
                                                            runat="server" ImageUrl="~/DesktopModules/SSM_Quote_Building/Image/tick.jpg"
                                                            Height="19" Width="19" />
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <HeaderStyle CssClass="HeaderStyle" Height="20px" BorderColor="Black" BorderStyle="Solid"
                                            BorderWidth="1px" />
                                    </asp:DataGrid>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <img alt="" style="width: 20px; height: 2px;" src="/ssm_dnn/portals/1/space.gif" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <hr />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="location">
                        <b>mapped locations</b>
                    </td>
                    <td colspan="2" class="location" style="padding-left: 15px;">
                    </td>
                </tr>
                <tr>
                <br/>
                    <td class="location" style="width:1%;padding-top:10px;">
                        <asp:Image ID="Image3" runat="server" 
                            ImageUrl="~/DesktopModules/SSM_Quote_Building/Image/red.png" Height="20px" 
                            Width="20px" />
                    </td>
                    <td class="style3" style="width:24%;padding-top:10px;">
                        school include in quote</td>
                    <td class="location" style="width:1%;padding-top:10px;">
                        <asp:Image ID="Image1" runat="server" 
                            ImageUrl="~/DesktopModules/SSM_Quote_Building/Image/back&amp;white.png" 
                            Height="20px" Width="20px" />
                    </td>
                    <td class="style3" style="width:34%;padding-top:10px;">
                        recommended school (not in quote)</td>
                    <td class="location" style="width:1%;padding-top:10px;">
                        <asp:Image ID="Image2" runat="server" 
                            ImageUrl="http://maps.google.com/mapfiles/ms/micons/blue-dot.png" 
                            Height="20px" Width="20px" />
                    </td>
                    <td class="style3" style="width:14%;padding-top:10px;">
                        your location</td>
                    <td colspan="2" class="location" style="padding-left: 15px;padding-top:10px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6" style="width: 75%;">
                        <div id="SSSMMap" style="height: 500px;">
                        </div>
                    </td>
                    <td colspan="2" style="width: 25%; vertical-align: top" valign="top">
                        <div class="location" style="margin-left: 10px;">
                            <b>schools in my quote</b></div>
                        <div id="SchoolInMyQuote" style="height: auto; width: 99%; margin-left: 5px;">
                        </div>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td valign="top" rowspan="2" style="width: 50%;" colspan="3">
                        <div>
                            <p class="location">
                                &nbsp;</p>
                            <div id="SchoolInMyQuote123" style="width: 97%; height: 0px; visibility: hidden">
                                <asp:DataGrid ID="dgSummary" Width="100%" runat="server" AutoGenerateColumns="False"
                                    HorizontalAlign="Center" ShowHeader="True" BorderStyle="Solid" BorderWidth="1px">
                                    <ItemStyle Height="20px" BorderStyle="Solid" BorderWidth="1px" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="# of locations">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "NoOfLocation")%>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="%">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Percentage")%>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox runat="server" Width="90%" ID="txtName0" MaxLength="50" Text='' />
                                            </FooterTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="distance from a school">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "DisFrmSchool")%>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox runat="server" Width="90%" ID="txtName0" MaxLength="50" Text='' />
                                            </FooterTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <HeaderStyle BorderStyle="Solid" BorderWidth="1px" Height="20px" Width="20px" />
                                </asp:DataGrid>
                            </div>
                        </div>
                    </td>
                    <td style="width: 50%;" colspan="5" rowspan="2" align="right">
                        <br />
                        <asp:Button ID="btnNext" runat="server" OnClientClick="javascript:finalSelection()"
                            OnClick="btnNext_Click" CausesValidation="False" Text="Next" Style="height: 26px"
                            UseSubmitBehavior="true" />
                    </td>
                </tr>
                <tr>
                    <%-- <%#NearestSchooltabel_id.ClientID%>--%>
                </tr>
            </table>
            <div class="clr">
                &nbsp;</div>
        </div>
        <!--ouraudience_content start here-->
    </div>
    <!--subcontainer start here-->
</div>
<asp:Label ID="lblmessage" runat="server" Style="display: none"></asp:Label>
<%--<%# DataBinder.Eval(Container.DataItem, "Id")%>--%>
<asp:TextBox ID="txtLat" runat="server" Style="display: none" ForeColor="Black">42.9672018125</asp:TextBox>
<asp:TextBox ID="txtLong" runat="server" Style="display: none" ForeColor="Black">-91.9911165</asp:TextBox>
<asp:TextBox runat="server" ID="txtzip_data" Style="display: none">id_tabel</asp:TextBox>
<span id="CountSchool" style="display: none;" /><span id="UseForDelQuote" style="display: none;">Final_Quote</span>
<input id="FinalChoice" type="hidden" runat="server" />
<input id="hdnMyLoctionLat" type="hidden" runat="server" />
<input id="hdnMyLoctionLong" type="hidden" runat="server" />
<input id="hdnTableID" type="hidden" runat="server" value="id_tabel" />
<input id="hdnEmailStringGMap" type="hidden" runat="server" />
<input id="hdnAllGmapMark" type="hidden" runat="server" />
<input id="hdbInvestroAddress" type="hidden" runat="server" />
<input id="hdnInnerTblName" type="hidden" runat="server" value="id_tabel_" />
<input id="hdnSelRowZip" type="hidden" runat="server"/>

<script type="text/javascript">

    var EmailDataForGmap;
    //to add all check school from recommened list to final list when new row add(this is an update panel evnet)    
    function load() {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(CallFunctionEnd);
    }

    function CallFunctionEnd() {
        var finaResutl = document.getElementById("SchoolInMyQuote");
        FirstRow(finaResutl);
        ChkSameSchoolOnRowAdd();
        RemoveInvMarkerOnDelete();
        var tabl = document.getElementById("<%=dgMyLocation.ClientID%>");
        if (tabl != null) {
            var tr = tabl.rows[1];
            if (tr != null)
                tr.click();
        }
    }

    //function to all checked box when school is selected form list.
    //to reslove issue of school check box selection on row add
    function ChkSameSchoolOnRowAdd() {

        try {
            var lastRow;
            if (document.getElementById("<%=dgMyLocation.ClientID%>") != null) {
                var tabl = document.getElementById("<%=dgMyLocation.ClientID%>");

                //tofind last data row no in grid
                if (tabl.rows.length > 0) {
                    var l = tabl.rows.length;
                    var tr = tabl.rows[l - 2];
                    lastRow = l - 2;
                    for (j = 0; j < lastRow - 1; j++) {
                        //to find last row check box table
                        var inTableId = document.getElementById("<%=hdnInnerTblName.ClientID%>").value + parseInt(j + 1);
                        //alert(document.getElementById("<%=hdnInnerTblName.ClientID%>").value + parseInt(j + 1));

                        var innerTable = document.getElementById(inTableId);

                        var legnth = innerTable.rows.length;
                        //alert("out=" + legnth);
                        for (i = 0; i < legnth - 1; i++) {
                            test("chkChoice_" + parseInt(j + 1) + i);
                        }
                    }
                }
                LastRowConsist(lastRow);
            }
        }
        catch (err) {
        }

    }

    function LastRowConsist(lastRow) {

        try {
            var inTableId = document.getElementById("<%=hdnInnerTblName.ClientID%>").value + parseInt(lastRow);
            var innerTable = document.getElementById(inTableId);
            var legnth = innerTable.rows.length;
            //alert("out=" + legnth);
            for (i = 0; i < legnth - 1; i++) {
                test("chkChoice_" + parseInt(lastRow) + i);
            }
        }
        catch (err) {
        }

    }


    function test(checkBoxID) {
        try {

            var getClickChekcbox = checkBoxID.split('_');
            var currSchool;
            var i = parseInt(getClickChekcbox[1]);
            var schName = document.getElementById("schoolName_" + i).innerHTML;
            var schID;
            var chkStatus = document.getElementById("chkChoice_" + i).checked;
            if (schName != null) {
                for (var j = 1; j < 9; j++) {
                    for (var i = 0; i < 9; i++) {
                        if (document.getElementById("chkChoice_" + j + i + "") != null) {
                            currSchool = document.getElementById("schoolName_" + j + i + "").innerHTML;
                            if (schName == currSchool) {
                                if (document.getElementById("chkChoice_" + j + i + "").checked == false) {
                                    document.getElementById("chkChoice_" + j + i + "").checked = chkStatus;
                                    schID = document.getElementById("schoolId_" + j + i + "").innerHTML;
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (err) {

        }
    }



    //---------Add School form Nearest List to Final List---------//
    function SchholInMyQuote(chk_ID) {

        try {
            var schName;
            var schID;
            var html_tab = "";
            var TableContent = '';
            var finaResutl = document.getElementById("SchoolInMyQuote");
            var findTable = document.getElementById("UseForDelQuote").innerHTML;

            if (document.getElementById(findTable) == null) {
                FirstRow(finaResutl);
            }
            else {

                addRow(findTable, chk_ID.id);
            }
        }
        catch (err) {
        }


    }

    function FirstRow(finaResutl) {

        try {
            finaResutl.innerHTML = "";
            var uniqueCheck;
            var allSchool = "";
            var currSchool;

            html_tab = '<table id="Final_Quote" align="left" width="99%" border="0" cellpadding="4" cellspacing="2" bgcolor="#333333"><tr bgcolor="#ffffff"><th></th><th Style="display:none">SchoolID</th><th  align="left">School Name</th><th Style="display:none">FinalSchLat</th><th Style="display:none">FinalSchLong</th></tr>';
            var countSchool = document.getElementById("CountSchool").innerHTML;
            for (var j = 1; j < 9; j++) {
                for (var i = 0; i < 9; i++) {                      //is for uninq no assign to div
                    if (document.getElementById("chkChoice_" + j + i + "") != null) {
                        if (document.getElementById("chkChoice_" + j + i + "").checked) {
                            currSchool = document.getElementById("schoolName_" + j + i + "").innerHTML;
                            if (allSchool.search(currSchool) == -1) {
                                allSchool += "_" + document.getElementById("schoolName_" + j + i + "").innerHTML;
                                schID = document.getElementById("schoolId_" + j + i + "").innerHTML;
                                schName = document.getElementById("schoolName_" + j + i + "").innerHTML;
                                finalSchLat = document.getElementById("lat_" + j + i + "").innerHTML;
                                finalSchLong = document.getElementById("long_" + j + i + "").innerHTML;
                                html_tab += '<tr bgcolor="#ffffff"><td align="center"><img id="DelSchFromQuote" onclick="javascript:DelFromFinalQuote(this);javascript:UncheckOnDelete(' + schID + ');"  src="/ssm_dnn/DesktopModules/SSM_Quote_Building/Image/delete.png" style=" width:23px; height:23px;"/></td><td Style="display:none">' + schID + '</td><td sytle="margin-left:10px;"> ' + schName + '</td><td Style="display:none">' + finalSchLat + '</td><td Style="display:none">' + finalSchLong + '</td></tr>';
                                //EmailDataForGmap += "&markers=color:blue|label:S" + "|" + finalSchLat + "," + finalSchLong + "";
                                EmailDataForGmap += finalSchLat + "," + finalSchLong + "|";
                                document.getElementById("<%=hdnEmailStringGMap.ClientID%>").value = EmailDataForGmap;
                            }
                            //alert(document.getElementById("<%=hdnEmailStringGMap.ClientID%>").value);
                        }
                    }
                }
            }
            html_tab += '</table>';
            finaResutl.innerHTML = html_tab;

        }
        catch (err) {

        }


    }

    function addRow(tableID, checkBoxID) {

        try {
            var table = document.getElementById(tableID);
            var countSchool = document.getElementById("CountSchool").innerHTML;
            var rowCount = table.rows.length;
            var getClickChekcbox = checkBoxID.split('_');
            var uniqueCheck;

            var i = parseInt(getClickChekcbox[1]);

            if (document.getElementById("chkChoice_" + i + "") != null) {
                if (document.getElementById("chkChoice_" + i + "").checked) {
                    schID = document.getElementById("schoolId_" + i + "").innerHTML;
                    schName = document.getElementById("schoolName_" + i + "").innerHTML;
                    finalSchLat = document.getElementById("lat_" + i + "").innerHTML;
                    finalSchLong = document.getElementById("long_" + i + "").innerHTML;
                    uniqueCheck = uniqueSchoolName(schName);
                    if (uniqueCheck == 0) {
                        var row = table.insertRow(rowCount);
                        var cell1 = row.insertCell(0);
                        var element1 = document.createElement("img");
                        element1.id = "DelSchFromQuote";
                        element1.setAttribute('onclick', 'DelFromFinalQuote(this);UncheckOnDelete(' + schID + ');');
                        element1.setAttribute('src', '/ssm_dnn/DesktopModules/SSM_Quote_Building/Image/delete.png');
                        element1.setAttribute('style', 'width:23px; height:23px; ');
                        cell1.setAttribute('align', 'center');
                        cell1.appendChild(element1);
                        cell1.setAttribute('bgcolor', '#ffffff');

                        var cell2 = row.insertCell(1);
                        cell2.style.display = "none";
                        cell2.innerHTML = schID;

                        var cell3 = row.insertCell(2);
                        cell3.setAttribute('bgcolor', '#ffffff');
                        cell3.setAttribute('margin-left', '10px');
                        cell3.innerHTML = schName;

                        var cell4 = row.insertCell(3);
                        cell4.style.display = "none";
                        cell4.innerHTML = finalSchLat;

                        var cell5 = row.insertCell(4);
                        cell5.style.display = "none";
                        cell5.innerHTML = finalSchLong;
                        EmailDataForGmap += finalSchLat + "," + finalSchLong + "|";
                        document.getElementById("<%=hdnEmailStringGMap.ClientID%>").value = EmailDataForGmap;
                    }

                }
            }
        }
        catch (err) {
        }



    }

    function uniqueSchoolName(schNameToCheck) {
        var result = 0;
        var findTable = document.getElementById("UseForDelQuote").innerHTML;
        var tabl = document.getElementById(findTable);
        if (tabl != null) {
            if (tabl.rows.length > 0) {
                var l = tabl.rows.length;
                var i = 0;
                var s = "";
                for (i = 1; i < l; i++) {
                    var tr = tabl.rows[i];
                    var schName = tr.cells[2].innerHTML
                    if (schName == schNameToCheck) {
                        result = 1;
                    }

                }
            }
        }
        return result;
    }




    function MarkAllSameSchool(checkBoxID) {

        var getClickChekcbox = checkBoxID.split('_');
        var currSchool;
        var i = parseInt(getClickChekcbox[1]);
        var schName = document.getElementById("schoolName_" + i).innerHTML;
        var schID;

        var chkStatus = document.getElementById("chkChoice_" + i).checked;

        if (schName != null) {
            for (var j = 1; j < 9; j++) {
                for (var i = 0; i < 9; i++) {
                    if (document.getElementById("chkChoice_" + j + i + "") != null) {
                        currSchool = document.getElementById("schoolName_" + j + i + "").innerHTML;
                        if (schName == currSchool) {
                            document.getElementById("chkChoice_" + j + i + "").checked = chkStatus;
                            schID = document.getElementById("schoolId_" + j + i + "").innerHTML;
                        }
                    }
                }
            }
            if (chkStatus == false) {
                //alert("false");
                DelOnCheckUncheck(schID);
            }

        }

    }


    //-----function to put marker using zipcode

    function DelFromFinalQuote(obj) {

        var par = obj.parentNode;
        while (par.nodeName.toLowerCase() != 'tr') {
            par = par.parentNode;
        }
        var findTable = document.getElementById("UseForDelQuote").innerHTML;
        if (findTable != null) {
            document.getElementById(findTable).deleteRow(par.rowIndex);
        }

    }


    function DelOnCheckUncheck(schoolID) {
        var findTable = document.getElementById("UseForDelQuote").innerHTML;
        var tabl = document.getElementById(findTable);
        if (tabl.rows.length > 0) {
            var l = tabl.rows.length;
            var i = 0;
            var s = "";
            for (i = 0; i < l; i++) {
                var tr = tabl.rows[i];
                if (schoolID == tr.cells[1].innerHTML) {
                    tabl.deleteRow(i);
                }
            }

        }
    }

    //to uncheck school form grid when it deleted form final list of school.
    function UncheckOnDelete(schID) {
        try {
            for (var j = 1; j < 9; j++) {
                for (var i = 0; i < 9; i++) {
                    if (document.getElementById("schoolId_" + j + i + "") != null) {
                        if (document.getElementById("schoolId_" + j + i + "").innerHTML != "") {
                            if (document.getElementById("schoolId_" + j + i + "").innerHTML == schID) {
                                document.getElementById("chkChoice_" + j + i + "").checked = false;

                            }
                        }
                    }
                }
            }
           
            //to reset marker on school delete on final selection.
            var tabl = document.getElementById("<%=dgMyLocation.ClientID%>");
            if (tabl != null) {
                var tr = tabl.rows[1];
                if (tr != null)
                    tr.click();
            }
        }
        catch (err) {
        }

    }
    function finalSelection() {
        var findTable = document.getElementById("UseForDelQuote").innerHTML;
        var tabl = document.getElementById(findTable);
        if (tabl.rows.length > 0) {
            var l = tabl.rows.length;
            var i = 0;
            var s = "";
            for (i = 1; i < l; i++) {
                var tr = tabl.rows[i];
                var schName = tr.cells[2].innerHTML
                s = s + schName + "*";
            }
            document.getElementById("<%=FinalChoice.ClientID%>").value = s;
            
        }
    }

    function addRowOnEnterClick(event, controlID) {

        if (document.getElementById(controlID.replace("txtZip", "lbtnAdd")) != null) {
            if (event.which || event.keyCode) {
                if ((event.which == 13) || (event.keyCode == 13)) {
                    document.getElementById(controlID.replace("txtZip", "lbtnAdd")).click(); return false;
                }
            }
            else {
                return true
            };
        }
    }
    load();
</script>

