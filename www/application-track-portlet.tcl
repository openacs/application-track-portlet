ad_page_contract {

    The logic for the user-tracking portlet.

    @creation-date 2005-11-4
    @author Pablo Muñoz (pablomp@tid.es)
    @author David Ortega (doa@tid.es)

} -query {
} -properties {
	community_id_p: onevalue
	community_id: onevalue
	admin_p: onevalue  
	user_id: onevalue 
}

array set config $cf
set list_of_package_ids [lsort $config(package_id)]

set community_id [dotlrn_community::get_community_id]
set user_id [ad_conn user_id]

if {[exists_and_not_null community_id]} {
	set community_id_p 1
	
} else {
	set community_id_p 0
}


ad_return_template 
