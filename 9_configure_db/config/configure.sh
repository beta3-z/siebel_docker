login=sys as sysdba
password=Oradoc_db1

function import() {
	local file="$1"

	cat "./$file" sqlplus "$login/$password"
}

import before.sql
import grantusr.sql
