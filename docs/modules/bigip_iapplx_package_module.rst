.. _bigip_iapplx_package:


bigip_iapplx_package - Manages Javascript iApp packages on a BIG-IP
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.5


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manages Javascript iApp packages on a BIG-IP. This module will allow you to deploy iAppLX packages to the BIG-IP and manage their lifecycle.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 2.2.3
  * Requires BIG-IP >= 12.1.0
  * The 'rpm' tool installed on the Ansible controller


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
                <tr><td>package<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The iAppLX package that you want to upload or remove. When <code>state</code> is <code>present</code>, and you intend to use this module in a <code>role</code>, it is recommended that you use the <code>{{ role_path }}</code> variable. An example is provided in the <code>EXAMPLES</code> section.</div><div>When <code>state</code> is <code>absent</code>, it is not necessary for the package to exist on the Ansible controller. If the full path to the package is provided, the fileame will specifically be cherry picked from it to properly remove the package.</div>        </td></tr>
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
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li></ul></td>
        <td><div>Whether the iAppLX package should exist or not.</div>        </td></tr>
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

    
    - name: Add an iAppLX package
      bigip_iapplx_package:
        package: MyApp-0.1.0-0001.noarch.rpm
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost
    
    - name: Add an iAppLX package stored in a role
      bigip_iapplx_package:
        package: "{{ roles_path }}/files/MyApp-0.1.0-0001.noarch.rpm'"
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost
    
    - name: Remove an iAppLX package
      bigip_iapplx_package:
        package: MyApp-0.1.0-0001.noarch.rpm
        password: secret
        server: lb.mydomain.com
        state: absent
        user: admin
      delegate_to: localhost


Notes
-----

.. note::
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - Requires the rpm tool be installed on the host. This can be accomplished through different ways on each platform. On Debian based systems with ``apt``; ``apt-get install rpm``. On Mac with ``brew``; ``brew install rpm``. This command is already present on RedHat based systems.
    - Requires BIG-IP < 12.1.0 because the required functionality is missing on versions  earlier than that.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`modules_support`


For help in developing on modules, should you be so inclined, please read :doc:`community`, :doc:`dev_guide/developing_test_pr` and :doc:`dev_guide/developing_modules`.