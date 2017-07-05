                    <ul class="page-sidebar-menu   " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                        <li class="nav-item start ">
                           <!--  <a href="javascript:;" class="nav-link nav-toggle"> -->
                           <a href="${pageContext.request.contextPath}/token/getTokens" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">Dashboard</span>
                                <span class="arrow"></span>
                            </a>
                           
                        </li>
                        <li class="heading">
                            <h3 class="uppercase">Features</h3>
                        </li>
                       
                             <li class="nav-item submenuTab">
                                    <a href="${pageContext.request.contextPath}/token/createToken" class="nav-link ">
                                         <i class="icon-puzzle"></i><span class="title">Create Tokens
                                            </span>
                                    </a>
                             </li>  
                                
                                                        
                        
                                <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/user/getUsers" class="nav-link ">
                                       <i class="icon-bulb"></i> <span class="title">User Managment</span>
                                    </a>
                                </li> 
                                
                             <%--    <li class="nav-item  ">
                                    <a href="${pageContext.request.contextPath}/register/getUsers" class="nav-link ">
                                       <i class="icon-bulb"></i> <span class="title">Requesting Users</span>
                                    </a>
                                </li> --%>
                                
                       
                         <li class="nav-item  ">
                            <a href="${pageContext.request.contextPath}/lab/labManagement" class="nav-link nav-toggle">
                                <i class="icon-settings"></i>
                                <span class="title">Labs/Doctors Management</span>
                               
                            </a>
                        </li>
                        
                        <li class="nav-item  ">
                            <a href="${pageContext.request.contextPath}/location/locationManagement" class="nav-link nav-toggle">
                                <i class="icon-pointer"></i>
                                <span class="title">Location/Division Management</span>
                               
                            </a>
                        </li>
                        
                      
                    </ul>