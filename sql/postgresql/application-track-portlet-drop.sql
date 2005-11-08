-- /application-track-portlet/sql/postgresql/application-track-portlet-drop.sql
--

-- Drops application-track datasources for portal portlets

-- @author David Ortega (doa@tid.es)
-- @creation-date 2004-10-25


create function inline_1()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
      from portal_datasources
     where name = ''application_track_portlet'';

   if not found then
     RAISE EXCEPTION '' No datasource id found '', ds_id;
     ds_id := null;
   end if;

  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
  end if;

	-- drop the hooks
	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''GetMyName''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''GetPrettyName''
	);


	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''Link''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''AddSelfToPage''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''Show''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''Edit''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''application_track_portlet'',
	       ''RemoveSelfFromPage''
	);

	-- Drop the binding
	perform acs_sc_binding__delete (
	    ''portal_datasource'',
	    ''application_track_portlet''
	);

	-- drop the impl
	perform acs_sc_impl__delete (
		''portal_datasource'',
		''application_track_portlet''
	);
  	
	return 0;
end;' language 'plpgsql';

select inline_1();
drop function inline_1();

\i application-track-admin-portlet-drop.sql
