<%@ page import="account.Security" %>
<%@ page import = "java.util.List" %>
<%@ page import = "person.PersonController" %>
<%
	if (session.getAttribute("login") == null || session.getAttribute("accountID") ==  null) {
		response.sendRedirect("login.jsp");
	} else {
		String login = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		String accountID = Security.getGroupID(username);

		String uri = request.getRequestURI();

		String pageName = uri.substring(uri.lastIndexOf("/")+1);

		boolean permission = PermissionsManager.checkPermission(Integer.parseInt(accountID), pageName, "read");
		if (login.equals("1")) {
			if(!permission)
			{
				session.setAttribute("error", "You do not have permission to access this page.");
				response.sendRedirect("result.jsp");
				return;
				
			}
			
			List<String> countryList = null;
			List<String> languageList = null;
			List<String> ethinList = null;
			List<String> suffixList = null;
			List<String> genderList = null;
			 countryList = PersonController.getSelectList("country");
			 languageList =  PersonController.getSelectList("language");
			 ethinList =  PersonController.getSelectList("ethinicity");
			 suffixList = PersonController.getSelectList("suffix");
			 genderList = PersonController.getSelectList("gender");
%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" dir="ltr" lang="en-US"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" dir="ltr" lang="en-US"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" dir="ltr" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html dir="ltr" lang="en-US">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />

<title>SIS Main Page</title>

<link rel="stylesheet" href="css/dash/ui-lightness/jquery-ui-1.8.18.custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/dash/validationEngine.jquery.css" type="text/css"/>
<link rel="stylesheet" href="css/dash/icons.css" type="text/css" />
<link rel="stylesheet" href="css/dash/forms.css" type="text/css" />
<link rel="stylesheet" href="css/dash/tables.css" type="text/css" />
<link rel="stylesheet" href="css/dash/ui.css" type="text/css" />
<link rel="stylesheet" href="css/dash/style.css" type="text/css" />
<link rel="stylesheet" href="css/dash/responsiveness.css" type="text/css" />

<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
<!-- Spinner -->
<script type="text/javascript" src="scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.spinner.js"></script>
<!-- Validation engine -->
<script type="text/javascript" src="scripts/languages/jquery.validationEngine-en.js" charset="utf-8"></script>
<script type="text/javascript" src="scripts/jquery.validationEngine.js"></script>
<!-- Knob -->
<script type="text/javascript" src="scripts/jquery.knob.js"></script>
<!-- Masked inputs -->
<script type="text/javascript" src="scripts/jquery.masked-inputs.js"></script>
<!-- Chosen -->
<script type="text/javascript" src="scripts/jquery.chosen.js"></script>
<!-- Draggable Slider -->
<script type="text/javascript" src="scripts/jquery.slider.js"></script>
<!-- WYSIHTML5 -->
<script type="text/javascript" src="scripts/jquery.wysihtml5.js"></script>
<!-- iPhone Style Checkbox -->
<script type="text/javascript" src="scripts/jquery.iphonecheckbox.js"></script>
<!-- Minicolors -->
<script type="text/javascript" src="scripts/jquery.minicolors.js"></script>

<!-- Caffeine custom JS -->
<script type="text/javascript" src="scripts/custom.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function() {
		// Form validate
		jQuery("#ap").validationEngine();
	});
</script>



<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lte IE 7]> <script src="scripts/IE8.js" type="text/javascript"></script> <![endif]-->
<!--[if lt IE 7]> <link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/> <![endif]-->

</head>

<body id="index" class="home">

	<div id="loading-block"></div>
	<!-- Loading block -->

	<!-- Container -->
	<div id="container">

		<!-- Header -->
		<header id="header">



			<section id="userinfo">
				<span class="welcome">Welcome <strong><%=username%></strong>.

				</span>
				<div class="profile">
					<div class="links">
						<a href="logout.jsp" class="logout">Logout</a>
					</div>

				</div>
			</section>
		</header>
		<!-- /Header -->

		<div class="clear"></div>
		<nav id="sidebar">
			<div class="sidebar-top"></div>

			<h3>Navigate</h3>

			<!-- Nav menu -->
			<ul class="nav">
				<%@ include file="permissionNavigation.jsp" %>
			</ul>
			<!-- /Nav menu -->

			<div class="blocks-separator"></div>
		</nav>
		<!-- Sidebar -->


		<div id="jgrowl" class="bottom-right"></div>

		<!-- Playground -->
		<section id="playground">
			<div class="three-fourths breadcrumb">
				<span><a href="#" class="icon entypo home"></a></span> <span
					class="middle"></span> <span>People</span> <span
					class="middle"></span> <span>Add a Person</span> <span
					class="end"></span>
			</div>
			<div class="clear"></div>
			<form name="ap" id="ap" method="post"
							action="PersonController.jsp">
							<input type="hidden" name="type" id="type" value="aPerson">
			<div class="one-half">
				<div class="box">
					<div class="inner">
						

							<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Demographic Infomation</span>
							</div>
							<div class="contents">
								<div class="row">
									<label>First Name</label>
									<div class="field-box">
										<input id="fname" name="fname" type="text" maxlength="50"
											class="large">
									</div>
									<div class="clear"></div>
								</div>

								<div class="row">
									<label>Last Name</label>
									<div class="field-box">
										<input id="lname" name="lname" type="text" maxlength="50"
											class="large">
									</div>
									<div class="clear"></div>
								</div>

								<div class="row">
									<label>Middle Name</label>
									<div class="field-box">
										<input id="mname" name="mname" type="text" maxlength="50"
											class="large">
									</div>
									<div class="clear"></div>
								</div>


								<div class="row">
                            	<label>Suffix</label> <div class="field-box">
                                	<select id = "suffix" name = "suffix">
                                		<%
                                     if(suffixList != null)
                                     {
                                    	 for (int i=0; i<suffixList.size(); i++)
                                         {
                                    		 String current = suffixList.get(i);
                                    		 out.println("<option value = \"" + current + "\">" + current + "</option>");

                                         } 
                                     }
                                    	%>
                                	 </select>
                                </div>
                                <div class="clear"></div>
                            </div>

								<div class="row">
                            	<label>Gender</label> <div class="field-box">
                                	<select id = "gender" name = "gender">
                                    	<%
                                     if(genderList != null)
                                     {
                                    	 for (int i=0; i<genderList.size(); i++)
                                         {
                                    		 String current = genderList.get(i);
                                    		 out.println("<option value = \"" + current + "\">" + current + "</option>");

                                    		
                                         
                                         } 
                                     }
                                    	%>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
								

								<div class="row">
									<label>Birthdate</label>
									<div class="field-box">
										 <input
											name="birth" id="birth" type="text"
											class="validate[required, custom[date],past[2013/03/27]]">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
                            	<label>Primary Language</label> <div class="field-box">
                                	<select id = "language" name = "language">
                                    	<%
                                     if(languageList != null)
                                     {
                                    	 for (int i=0; i<languageList.size(); i++)
                                         {
                                    		 String current = languageList.get(i);
											 out.println("<option value = \"" + current + "\">" + current + "</option>");

                                    		
                                         
                                         } 
                                     }
                                    	%>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
                              <div class="row">
                            	<label>Ethinicity</label> <div class="field-box">
                                	<select id = "ethinicity" name = "ethinicity">
                                    	<%
                                     if(ethinList != null)
                                     {
                                    	 for (int i=0; i<ethinList.size(); i++)
                                         {
                                    		 String current = ethinList.get(i);
											 out.println("<option value = \"" + current + "\">" + current + "</option>");
                                    		 
                                    		
                                         
                                         } 
                                     }
                                    	%>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>

								

							</div>
							
						
					</div>
				</div>
			</div>
			
			
			
			
			<div class="one-half">
				<div class="box">
					<div class="inner">
					
					<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Address</span>
							</div>
							<div class="contents">
							
								<div class="row">
									<label>House Number</label>
									<div class="field-box">
										<input id="house" name="house" type="text"
											maxlength = "10" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Apartment Number</label>
									<div class="field-box">
										<input id="apt" name="apt" type="text"
											maxlength = "10" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Street</label>
									<div class="field-box">
										<input id="street" name="street" type="text" maxlength = "100" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>State</label>
									<div class="field-box">
										<input id="state" name="state" type="text"
											maxlength = "15" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>City</label>
									<div class="field-box">
										<input id="city" name="city" type="text"
											maxlength = "20" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Direction</label>
									<div class="field-box">
										<input id="dir" name="dir" type="text"
											maxlength = "1" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
									<label>Zip Code</label>
									<div class="field-box">
										<input id="zip" name="zip" type="text"
											maxlength = "10" class="large">
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="row">
                            	<label>Country</label> <div class="field-box">
                                	<select id = "country" name = "country" data-placeholder="Your Country" style="width:350px;" class="chzn-select" tabindex="6">
                                       
                                           
<option value="United States">United States</option> 
<option value="United Kingdom">United Kingdom</option> 
<option value="Afghanistan">Afghanistan</option> 
<option value="Albania">Albania</option> 
<option value="Algeria">Algeria</option> 
<option value="American Samoa">American Samoa</option> 
<option value="Andorra">Andorra</option> 
<option value="Angola">Angola</option> 
<option value="Anguilla">Anguilla</option> 
<option value="Antarctica">Antarctica</option> 
<option value="Antigua and Barbuda">Antigua and Barbuda</option> 
<option value="Argentina">Argentina</option> 
<option value="Armenia">Armenia</option> 
<option value="Aruba">Aruba</option> 
<option value="Australia">Australia</option> 
<option value="Austria">Austria</option> 
<option value="Azerbaijan">Azerbaijan</option> 
<option value="Bahamas">Bahamas</option> 
<option value="Bahrain">Bahrain</option> 
<option value="Bangladesh">Bangladesh</option> 
<option value="Barbados">Barbados</option> 
<option value="Belarus">Belarus</option> 
<option value="Belgium">Belgium</option> 
<option value="Belize">Belize</option> 
<option value="Benin">Benin</option> 
<option value="Bermuda">Bermuda</option> 
<option value="Bhutan">Bhutan</option> 
<option value="Bolivia">Bolivia</option> 
<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option> 
<option value="Botswana">Botswana</option> 
<option value="Bouvet Island">Bouvet Island</option> 
<option value="Brazil">Brazil</option> 
<option value="British Indian Ocean Territory">British Indian Ocean Territory</option> 
<option value="Brunei Darussalam">Brunei Darussalam</option> 
<option value="Bulgaria">Bulgaria</option> 
<option value="Burkina Faso">Burkina Faso</option> 
<option value="Burundi">Burundi</option> 
<option value="Cambodia">Cambodia</option> 
<option value="Cameroon">Cameroon</option> 
<option value="Canada">Canada</option> 
<option value="Cape Verde">Cape Verde</option> 
<option value="Cayman Islands">Cayman Islands</option> 
<option value="Central African Republic">Central African Republic</option> 
<option value="Chad">Chad</option> 
<option value="Chile">Chile</option> 
<option value="China">China</option> 
<option value="Christmas Island">Christmas Island</option> 
<option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option> 
<option value="Colombia">Colombia</option> 
<option value="Comoros">Comoros</option> 
<option value="Congo">Congo</option> 
<option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option> 
<option value="Cook Islands">Cook Islands</option> 
<option value="Costa Rica">Costa Rica</option> 
<option value="Cote D'ivoire">Cote D'ivoire</option> 
<option value="Croatia">Croatia</option> 
<option value="Cuba">Cuba</option> 
<option value="Cyprus">Cyprus</option> 
<option value="Czech Republic">Czech Republic</option> 
<option value="Denmark">Denmark</option> 
<option value="Djibouti">Djibouti</option> 
<option value="Dominica">Dominica</option> 
<option value="Dominican Republic">Dominican Republic</option> 
<option value="Ecuador">Ecuador</option> 
<option value="Egypt">Egypt</option> 
<option value="El Salvador">El Salvador</option> 
<option value="Equatorial Guinea">Equatorial Guinea</option> 
<option value="Eritrea">Eritrea</option> 
<option value="Estonia">Estonia</option> 
<option value="Ethiopia">Ethiopia</option> 
<option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option> 
<option value="Faroe Islands">Faroe Islands</option> 
<option value="Fiji">Fiji</option> 
<option value="Finland">Finland</option> 
<option value="France">France</option> 
<option value="French Guiana">French Guiana</option> 
<option value="French Polynesia">French Polynesia</option> 
<option value="French Southern Territories">French Southern Territories</option> 
<option value="Gabon">Gabon</option> 
<option value="Gambia">Gambia</option> 
<option value="Georgia">Georgia</option> 
<option value="Germany">Germany</option> 
<option value="Ghana">Ghana</option> 
<option value="Gibraltar">Gibraltar</option> 
<option value="Greece">Greece</option> 
<option value="Greenland">Greenland</option> 
<option value="Grenada">Grenada</option> 
<option value="Guadeloupe">Guadeloupe</option> 
<option value="Guam">Guam</option> 
<option value="Guatemala">Guatemala</option> 
<option value="Guinea">Guinea</option> 
<option value="Guinea-bissau">Guinea-bissau</option> 
<option value="Guyana">Guyana</option> 
<option value="Haiti">Haiti</option> 
<option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option> 
<option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option> 
<option value="Honduras">Honduras</option> 
<option value="Hong Kong">Hong Kong</option> 
<option value="Hungary">Hungary</option> 
<option value="Iceland">Iceland</option> 
<option value="India">India</option> 
<option value="Indonesia">Indonesia</option> 
<option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option> 
<option value="Iraq">Iraq</option> 
<option value="Ireland">Ireland</option> 
<option value="Israel">Israel</option> 
<option value="Italy">Italy</option> 
<option value="Jamaica">Jamaica</option> 
<option value="Japan">Japan</option> 
<option value="Jordan">Jordan</option> 
<option value="Kazakhstan">Kazakhstan</option> 
<option value="Kenya">Kenya</option> 
<option value="Kiribati">Kiribati</option> 
<option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option> 
<option value="Korea, Republic of">Korea, Republic of</option> 
<option value="Kuwait">Kuwait</option> 
<option value="Kyrgyzstan">Kyrgyzstan</option> 
<option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option> 
<option value="Latvia">Latvia</option> 
<option value="Lebanon">Lebanon</option> 
<option value="Lesotho">Lesotho</option> 
<option value="Liberia">Liberia</option> 
<option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option> 
<option value="Liechtenstein">Liechtenstein</option> 
<option value="Lithuania">Lithuania</option> 
<option value="Luxembourg">Luxembourg</option> 
<option value="Macao">Macao</option> 
<option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option> 
<option value="Madagascar">Madagascar</option> 
<option value="Malawi">Malawi</option> 
<option value="Malaysia">Malaysia</option> 
<option value="Maldives">Maldives</option> 
<option value="Mali">Mali</option> 
<option value="Malta">Malta</option> 
<option value="Marshall Islands">Marshall Islands</option> 
<option value="Martinique">Martinique</option> 
<option value="Mauritania">Mauritania</option> 
<option value="Mauritius">Mauritius</option> 
<option value="Mayotte">Mayotte</option> 
<option value="Mexico">Mexico</option> 
<option value="Micronesia, Federated States of">Micronesia, Federated States of</option> 
<option value="Moldova, Republic of">Moldova, Republic of</option> 
<option value="Monaco">Monaco</option> 
<option value="Mongolia">Mongolia</option> 
<option value="Montserrat">Montserrat</option> 
<option value="Morocco">Morocco</option> 
<option value="Mozambique">Mozambique</option> 
<option value="Myanmar">Myanmar</option> 
<option value="Namibia">Namibia</option> 
<option value="Nauru">Nauru</option> 
<option value="Nepal">Nepal</option> 
<option value="Netherlands">Netherlands</option> 
<option value="Netherlands Antilles">Netherlands Antilles</option> 
<option value="New Caledonia">New Caledonia</option> 
<option value="New Zealand">New Zealand</option> 
<option value="Nicaragua">Nicaragua</option> 
<option value="Niger">Niger</option> 
<option value="Nigeria">Nigeria</option> 
<option value="Niue">Niue</option> 
<option value="Norfolk Island">Norfolk Island</option> 
<option value="Northern Mariana Islands">Northern Mariana Islands</option> 
<option value="Norway">Norway</option> 
<option value="Oman">Oman</option> 
<option value="Pakistan">Pakistan</option> 
<option value="Palau">Palau</option> 
<option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option> 
<option value="Panama">Panama</option> 
<option value="Papua New Guinea">Papua New Guinea</option> 
<option value="Paraguay">Paraguay</option> 
<option value="Peru">Peru</option> 
<option value="Philippines">Philippines</option> 
<option value="Pitcairn">Pitcairn</option> 
<option value="Poland">Poland</option> 
<option value="Portugal">Portugal</option> 
<option value="Puerto Rico">Puerto Rico</option> 
<option value="Qatar">Qatar</option> 
<option value="Reunion">Reunion</option> 
<option value="Romania">Romania</option> 
<option value="Russian Federation">Russian Federation</option> 
<option value="Rwanda">Rwanda</option> 
<option value="Saint Helena">Saint Helena</option> 
<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
<option value="Saint Lucia">Saint Lucia</option> 
<option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option> 
<option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option> 
<option value="Samoa">Samoa</option> 
<option value="San Marino">San Marino</option> 
<option value="Sao Tome and Principe">Sao Tome and Principe</option> 
<option value="Saudi Arabia">Saudi Arabia</option> 
<option value="Senegal">Senegal</option> 
<option value="Serbia and Montenegro">Serbia and Montenegro</option> 
<option value="Seychelles">Seychelles</option> 
<option value="Sierra Leone">Sierra Leone</option> 
<option value="Singapore">Singapore</option> 
<option value="Slovakia">Slovakia</option> 
<option value="Slovenia">Slovenia</option> 
<option value="Solomon Islands">Solomon Islands</option> 
<option value="Somalia">Somalia</option> 
<option value="South Africa">South Africa</option> 
<option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option> 
<option value="Spain">Spain</option> 
<option value="Sri Lanka">Sri Lanka</option> 
<option value="Sudan">Sudan</option> 
<option value="Suriname">Suriname</option> 
<option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option> 
<option value="Swaziland">Swaziland</option> 
<option value="Sweden">Sweden</option> 
<option value="Switzerland">Switzerland</option> 
<option value="Syrian Arab Republic">Syrian Arab Republic</option> 
<option value="Taiwan, Province of China">Taiwan, Province of China</option> 
<option value="Tajikistan">Tajikistan</option> 
<option value="Tanzania, United Republic of">Tanzania, United Republic of</option> 
<option value="Thailand">Thailand</option> 
<option value="Timor-leste">Timor-leste</option> 
<option value="Togo">Togo</option> 
<option value="Tokelau">Tokelau</option> 
<option value="Tonga">Tonga</option> 
<option value="Trinidad and Tobago">Trinidad and Tobago</option> 
<option value="Tunisia">Tunisia</option> 
<option value="Turkey">Turkey</option> 
<option value="Turkmenistan">Turkmenistan</option> 
<option value="Turks and Caicos Islands">Turks and Caicos Islands</option> 
<option value="Tuvalu">Tuvalu</option> 
<option value="Uganda">Uganda</option> 
<option value="Ukraine">Ukraine</option> 
<option value="United Arab Emirates">United Arab Emirates</option> 
<option value="United Kingdom">United Kingdom</option> 
<option value="United States">United States</option> 
<option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option> 
<option value="Uruguay">Uruguay</option> 
<option value="Uzbekistan">Uzbekistan</option> 
<option value="Vanuatu">Vanuatu</option> 
<option value="Venezuela">Venezuela</option> 
<option value="Viet Nam">Viet Nam</option> 
<option value="Virgin Islands, British">Virgin Islands, British</option> 
<option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option> 
<option value="Wallis and Futuna">Wallis and Futuna</option> 
<option value="Western Sahara">Western Sahara</option> 
<option value="Yemen">Yemen</option> 
<option value="Zambia">Zambia</option> 
<option value="Zimbabwe">Zimbabwe</option>

</select>
                                        
                                   
                                </div>
                                <div class="clear"></div>
                            </div>
								
					
					</div>
					
					</div>
				</div>
			</div>
			
			
			
			<div class="one-half">
				<div class="box">
					<div class="inner">
					
					<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Account Infomation</span>
							</div>
							<div class="contents">
								<div class="row">
									<label>User Name</label>
									<div class="field-box">
										<input id="username" name="username" type="text" class="large">
									</div>
									<div class="clear"></div>
								</div>

								<div class="row">
									<label>Password</label>
									<div class="field-box">
										<input id="password1" name="password1" type="password"
											class="large">
									</div>
									<div class="clear"></div>
								</div>

								<div class="row">
									<label>Confirm Password</label>
									<div class="field-box">
										<input id="password2" name="password2" type="password"
											class="large">
									</div>
									<div class="clear"></div>
								</div>
								
					
						
					
					
					
				</div>
			</div>
			</div>
			</div>
			
			
			<div class="one-half">
				<div class="box">
					<div class="inner">
					
					<div class="titlebar">
								<span class="icon entypo white browser"></span> <span
									class="w-icon">Contact Infomation</span>
							</div>
							<div class="contents">
								<div class="row">
									<label>Phone Number</label>
									<div class="field-box">
										<input id="phone" name="phone" type="text"
											maxlength = "10" class="large">
									</div>
									
									</div>
									<div class="row">
									<label>E-Mail Address</label>
									<div class="field-box">
										<input id="email" name="email" type="text"
											maxlength = "50" class="large">
									</div>
									</div>
								
					
					
					
					
					
				</div>
			</div>
			</div>
			</div>
			
			
			<div class="full-width">
				<div class="box">
					<div class="inner">
					
							<div class="contents">
							
							<div class="bar-big">
								<input type="submit" value="Submit"> <input type="reset"
									value="Reset">

							</div>
								
				</div>
			</div>
			</div>
			</div>
			
			
</form>
		</section>
	</div>
	<!-- /Container -->

</body>
</html>
<%
	} else {
			response.sendRedirect("login.jsp");
		}
	}
%>

