DROP TABLE albums;
DROP TABLE artists;


CREATE TABLE artists(
  id SERIAL primary key,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL primary key,
  title VARCHAR(255),
  artist_id INT references artists(id)
);
