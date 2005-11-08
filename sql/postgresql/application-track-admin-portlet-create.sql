-- /application-track-portlet/sql/postgresql/application-track-admin-portlet-create.sql
--
-- Creates User Tracking portlet
--
-- @author David Ortega (doa@tid.es)
-- @creation-date 2004-10-25
--

create function inline_0 ()
returns integer as '
declare
  ds_id 	portal_datasources.datasource_id%TYPE;
begin
	ds_id = portal_datasource__new(
        		''application_track_admin_portlet'',
        		''User Tracking Admin Portlet''
			);

RAISE NOTICE '' created new ds'';

	perform portal_datasource__set_def_param (
	 	ds_id,
		''t'',
   		''t'',
    		''shadeable_p'',
		''f''
	);

RAISE NOTICE '' set shadeable'';
	perform portal_datasource__set_def_param (
 	  	ds_id,
  		''t'',
	 	''t'',
    	 	''hideable_p'',
    	 	''f''
	);

RAISE NOTICE '' set hideable'';
	perform portal_datasource__set_def_param (
		ds_id,
		''t'',
 		''t'',
		''user_editable_p'',
 		''f''
	);

	perform portal_datasource__set_def_param (
 	       ds_id,
  	      ''t'',
	      ''t'',
	      ''shaded_p'',
	      ''f''
	);

	perform portal_datasource__set_def_param (
	        ds_id,
	        ''t'',
	        ''t'',
	        ''link_hideable_p'',
	        ''t''
	);

	perform portal_datasource__set_def_param (
		ds_id,
	        ''t'',
	        ''f'',
	        ''package_id'',
	        '' ''
	);


return 0;

end;' language 'plpgsql';



select inline_0();

drop function inline_0 ();

-- create the implementation
select acs_sc_impl__new (
        'portal_datasource',
        'application_track_admin_portlet',
        'application_track_admin_portlet'
);

-- add all the hooks
select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'GetMyName',
        'application_track_admin_portlet::get_my_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'GetPrettyName',
        'application_track_admin_portlet::get_pretty_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'Link',
        'application_track_admin_portlet::link',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'AddSelfToPage',
        'application_track_admin_portlet::add_self_to_page',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'Show',
        'application_track_admin_portlet::show',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'Edit',
        'application_track_admin_portlet::edit',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'application_track_admin_portlet',
        'RemoveSelfFromPage',
        'application_track_admin_portlet::remove_self_from_page',
        'TCL'
);

-- Add the binding
select acs_sc_binding__new(
	'portal_datasource',
 	'application_track_admin_portlet'
);
