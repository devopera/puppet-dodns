class dodns::server (

  # class arguments
  # ---------------
  # setup defaults

  # end of class arguments
  # ----------------------
  # begin class

) {
  include dns::server

  # Forward Zone
  dns::zone { 'example.com':
    soa => "ns1.example.com",
    soa_email => 'admin.example.com',
    nameservers => ["ns1"]
  }

  # Reverse Zone
  dns::zone { '1.168.192.IN-ADDR.ARPA':
    soa => "ns1.example.com",
    soa_email => 'admin.example.com',
    nameservers => ["ns1"]
  }

  # A Records:
  dns::record::a {
    'huey':
      zone => 'example.com',
      data => ["98.76.54.32"];
    'duey':
      zone => 'example.com',
      data => ["12.34.56.78", "12.23.34.45"];
    'luey':
      zone => 'example.com',
      data => ["192.168.1.25"],
      ptr => true; # Creates a matching reverse zone record.  Make sure you've added the proper reverse zone in the manifest.
  }
}
