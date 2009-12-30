<%--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
--%><%@page session="false" %><%
%><%@page import="org.apache.sling.api.resource.Resource,
                org.apache.sling.api.resource.ResourceUtil,
                org.apache.sling.api.resource.ValueMap,
                org.apache.sling.sample.slingshot.Constants" %><%
%><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects/><%
%><div class="photo">
<%
final ValueMap attr = ResourceUtil.getValueMap(resource);
    final String albumName = ResourceUtil.getName(ResourceUtil.getParent(resource));
    final String photoName = attr.get("jcr:title", ResourceUtil.getName(resource));
    final String relPath = resource.getPath();
    String imagePath = relPath;
    String previewPath = ResourceUtil.getParent(resource).getPath() + '/' + Constants.FOLDER_NAME_PREVIEW + '/' + ResourceUtil.getName(resource);
    if ( resource.getResourceResolver().getResource(previewPath) != null ) {
        imagePath = previewPath;
    }
%>
    <a href="<%= request.getContextPath() %><%=relPath%>.slingshot.html"><img src="<%=imagePath%>" width="100" height="100"/></a><br/>
    <p><a href="<%= request.getContextPath() %><%=relPath%>.slingshot.html"><%= photoName %></a></p>
    <p>Tags:&nbsp;
<%
String[] values = attr.get("slingshot:tags", String[].class);
if  (values != null ) {
    for(int k=0;k<values.length;k++) {
        if(k>0) out.write(", ");
        out.write(values[k]);
    }
    
}
%>
</p>
</div>
