--    Copyright 2023 Suraj Muraleedharan

--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at

--        http://www.apache.org/licenses/LICENSE-2.0

--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.

-- Role: "app-users-group"
-- DROP ROLE IF EXISTS "app-users-group";

CREATE ROLE "app-users-group" WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE "app-users-group" IS 'Application users group';

-- Role: "human-users-group"
-- DROP ROLE IF EXISTS "human-users-group";

CREATE ROLE "human-users-group" WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE "human-users-group" IS 'Human users group';

-- Role: sandbox
-- DROP ROLE IF EXISTS sandbox;

CREATE ROLE sandbox WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT "human-users-group" TO sandbox;

COMMENT ON ROLE sandbox IS 'Human user via SQL client'

-- Role: "admin-users-group"
-- DROP ROLE IF EXISTS "admin-users-group";

CREATE ROLE "admin-users-group" WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION;

COMMENT ON ROLE "admin-users-group" IS 'Admin users group for operators';

-- Role: "app-demo-admin"
-- DROP ROLE IF EXISTS "app-demo-admin";

CREATE ROLE "app-demo-admin" WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION;

GRANT "admin-users-group" TO "app-demo-admin" WITH ADMIN OPTION;

COMMENT ON ROLE "app-demo-admin" IS 'Demo application adminstrator';;
