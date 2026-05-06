CREATE OR REPLACE FUNCTION uuidv7()
RETURNS UUID AS $$
DECLARE
  unix_ms BIGINT;
  hex     TEXT;
BEGIN
  unix_ms := EXTRACT(EPOCH FROM clock_timestamp()) * 1000;
  hex := lpad(to_hex(unix_ms), 12, '0')
      || '7'
      || lpad(to_hex(floor(random() * 4096)::int), 3, '0')
      || lpad(to_hex(floor(random() * 4294967296)::int), 8, '0')
      || lpad(to_hex(floor(random() * 4294967296)::int), 8, '0');
  RETURN CAST(
    substring(hex, 1, 8) || '-' ||
    substring(hex, 9, 4) || '-' ||
    substring(hex, 13, 4) || '-' ||
    substring(hex, 17, 4) || '-' ||
    substring(hex, 21, 12)
  AS UUID);
END;
$$ LANGUAGE plpgsql;