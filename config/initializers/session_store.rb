# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mobhooks_session',
  :secret      => 'c843b917c47a4e4c249a00775a5f2b8daf36909269a937ad888e4746297744e168cb0deebb6b8872cba19f6c00d71d1556321b35cc6cfd6fa3cd3c8c619a4f16'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
