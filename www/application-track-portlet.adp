
<if @community_id_p@ ne 0>
<ul>
<li><a href="/application-track/communities">#application-track.Select_by_communities#</a></li>

<li><a href="/application-track/classes">#application-track.Select_by_department_term#</a></li>

<li><a href="/application-track/applications">#application-track.Select_by_applications#</a></li> 
</ul>
<br>
<ul>
<li><a href="/application-track/general?community_id=@community_id@">#application-track-portlet.application_general#</a></li>   
<li><a href="/application-track/specific?class_instance_id=@community_id@&Name=album&Name=assessments&Name=evaluation&Name=faqs&Name=file_storage&Name=forums&Name=lorsm&Name=news&Name=presentation&Name=weblogger">#application-track-portlet.application_specific#</a></li>
</ul>
 </if>
<else>
<ul>
<li><a href="/application-track/communities">#application-track.Select_by_communities#</a></li>

<li><a href="/application-track/classes">#application-track.Select_by_department_term#</a></li>

<li><a href="/application-track/applications">#application-track.Select_by_applications#</a></li> 
</ul>
</else>