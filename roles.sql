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

-- Role: admin_operator_group
-- DROP ROLE IF EXISTS admin_operator_group;

CREATE ROLE admin_operator_group WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION;

COMMENT ON ROLE admin_operator_group IS 'Admin operators via SQL client';

-- Role: operator_group
-- DROP ROLE IF EXISTS operator_group;

CREATE ROLE operator_group WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE operator_group IS 'Human operators group';

-- Role: operator_admin
-- DROP ROLE IF EXISTS operator_admin;

CREATE ROLE operator_admin WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION;

GRANT admin_operator_group TO operator_admin WITH ADMIN OPTION;

COMMENT ON ROLE operator_admin IS 'Operator adminstrator';

-- Role: operator
-- DROP ROLE IF EXISTS operator;

CREATE ROLE operator WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT operator_group TO operator;

COMMENT ON ROLE operator IS 'Human operator via SQL client';

-- Role: app_user
-- DROP ROLE IF EXISTS app_user;

CREATE ROLE app_user WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT rds_iam TO app_user;

COMMENT ON ROLE app_user IS 'Application user with AWS IAM authentication';

-- Alter the password for the user

ALTER USER operator_admin PASSWORD '<YOUR PASSWORD>';
