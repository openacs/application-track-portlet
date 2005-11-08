ad_library {

    Procedures to support the application-track management portlet.

    @creation-date 2004-10-25
    @author David Ortega (doa@tid.es)

}

namespace eval application_track_admin_portlet {

    ad_proc -private get_my_name {
    } {
        return "application_track_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#application-track.admin_portlet#"
    }

    ad_proc -private my_package_key {
    } {
        return "application-track-portlet"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Adds a UserTracking mgt admin PE to the given admin portal. There should only
        ever be one of these portals on an admin page with only one application_track_package_id

        @param portal_id The page to add self to
        @param package_id the id of the application_track package

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
        ]
    }

    ad_proc -public remove_self_from_page {
        portal_id
    } {
        Removes a UserTracking admin PE from the given portal
    } {
        portal::remove_element -portal_id $portal_id -portlet_name [get_my_name]
    }

    ad_proc -public show {
        cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "application-track-admin-portlet"
    }

}
