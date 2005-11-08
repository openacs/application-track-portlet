ad_page_contract {

    The display logic for the User Tracking Management admin portlet
    
    @creation-date 2005-11-4
    @author David Ortega (doa@tid.es)
    @author Pablo Muñoz (pablomp@tid.es)

} -properties {
community_id: onevalue   
}

array set config $cf
set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of application-track for admin purposes"
}        

set package_id [lindex $list_of_package_ids 0]        

set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]

set community_id [dotlrn_community::get_community_id]

ad_return_template 
