.. _bigip_iapp_template:


bigip_iapp_template - Manages TCL iApp templates on a BIG-IP
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.4


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manages TCL iApp templates on a BIG-IP. This module will allow you to deploy iApp templates to the BIG-IP and manage their lifecycle. The conventional way to use this module is to import new iApps as needed or by extracting the contents of the iApp archive that is provided at downloads.f5.com and then importing all the iApps with this module. This module can also update existing iApps provided that the source of the iApp changed while the name stayed the same. Note however that this module will not reconfigure any services that may have been created using the ``bigip_iapp_service`` module. iApps are normally not updated in production. Instead, new versions are deployed and then existing services are changed to consume that new template. As such, the ability to update templates in-place requires the ``force`` option to be used.




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
                <tr><td>content<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Sets the contents of an iApp template directly to the specified value. This is for simple values, but can be used with lookup plugins for anything complex or with formatting. <code>content</code> must be provided when creating new templates.</div>        </td></tr>
                <tr><td>force<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>Specifies whether or not to force the uploading of an iApp. When <code>yes</code>, will force update the iApp even if there are iApp services using it. This will not update the running service though. Use <code>bigip_iapp_service</code> to do that. When <code>no</code>, will update the iApp only if there are no iApp services using the template.</div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The name of the iApp template that you want to delete. This option is only available when specifying a <code>state</code> of <code>absent</code> and is provided as a way to delete templates that you may no longer have the source of.</div>        </td></tr>
                <tr><td>partition<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>Common</td>
        <td></td>
        <td><div>Device partition to manage resources on.</div>        </td></tr>
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
        <td><div>Whether the iApp template should exist or not.</div>        </td></tr>
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

    
    - name: Add the iApp contained in template iapp.tmpl
      bigip_iapp_template:
        content: "{{ lookup('template', 'iapp.tmpl') }}"
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost
    
    - name: Update a template in place
      bigip_iapp_template:
        content: "{{ lookup('template', 'iapp-new.tmpl') }}"
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost
    
    - name: Update a template in place that has existing services created from it.
      bigip_iapp_template:
        content: "{{ lookup('template', 'iapp-new.tmpl') }}"
        force: yes
        password: secret
        server: lb.mydomain.com
        state: present
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