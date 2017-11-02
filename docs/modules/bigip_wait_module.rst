.. _bigip_wait:


bigip_wait - Wait for a BIG-IP condition before continuing
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.5


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* You can wait for BIG-IP to be "ready". By "ready", we mean that BIG-IP is ready to accept configuration.
* This module can take into account situations where the device is in the middle of rebooting due to a configuration change.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 2.2.3


Options
-------

.. raw:: html

    <table border=1 cellpadding=4>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                <tr><td>delay<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Number of seconds to wait before starting to poll.</div>        </td></tr>
                <tr><td>msg<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>This overrides the normal error message from a failure to meet the required conditions.</div>        </td></tr>
                <tr><td>password<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The password for the user account used to connect to the BIG-IP. This option can be omitted if the environment variable <code>F5_PASSWORD</code> is set.</div>        </td></tr>
                <tr><td>server<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The BIG-IP host. This option can be omitted if the environment variable <code>F5_SERVER</code> is set.</div>        </td></tr>
                <tr><td>server_port<br/><div style="font-size: small;"> (added in 2.2)</div></td>
    <td>no</td>
    <td>443</td>
        <td></td>
        <td><div>The BIG-IP server port. This option can be omitted if the environment variable <code>F5_SERVER_PORT</code> is set.</div>        </td></tr>
                <tr><td>sleep<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>1</td>
        <td></td>
        <td><div>Number of seconds to sleep between checks, before 2.3 this was hardcoded to 1 second.</div>        </td></tr>
                <tr><td>timeout<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>7200</td>
        <td></td>
        <td><div>Maximum number of seconds to wait for.</div><div>When used without other conditions it is equivalent of just sleeping.</div><div>The default timeout is deliberately set to 2 hours because no individual REST API.</div>        </td></tr>
                <tr><td>user<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The username to connect to the BIG-IP with. This user must have administrative privileges on the device. This option can be omitted if the environment variable <code>F5_USER</code> is set.</div>        </td></tr>
                <tr><td>validate_certs<br/><div style="font-size: small;"> (added in 2.0)</div></td>
    <td>no</td>
    <td>True</td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>If <code>no</code>, SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates. This option can be omitted if the environment variable <code>F5_VALIDATE_CERTS</code> is set.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Wait for BIG-IP to be ready to take configuration
      bigip_wait:
        password: secret
        server: lb.mydomain.com
        user: admin
      delegate_to: localhost
    
    - name: Wait a maximum of 300 seconds for BIG-IP to be ready to take configuration
      bigip_wait:
        timeout: 300
        password: secret
        server: lb.mydomain.com
        user: admin
      delegate_to: localhost
    
    - name: Wait for BIG-IP to be ready, don't start checking for 10 seconds
      bigip_wait:
        delay: 10
        password: secret
        server: lb.mydomain.com
        user: admin
      delegate_to: localhost


Notes
-----

.. note::
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`modules_support`


For help in developing on modules, should you be so inclined, please read :doc:`community`, :doc:`dev_guide/developing_test_pr` and :doc:`dev_guide/developing_modules`.