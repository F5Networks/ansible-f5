.. _iworkflow_iapp_template:


iworkflow_iapp_template - Manages iApp templates
++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.4


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manages TCL iApp services on a BIG-IP.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 2.3.0
  * iWorkflow >= 2.1.0


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
                <tr><td>device<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Managed BIG-IP that you want to get template JSON from. This option is only required when <code>state</code> is <code>present</code>.</div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The name of the iApp template that you want to create on the device. This is usually included in the template itself. This option is typically used in cases where the template no longer exists on disk (to reference) and the <code>state</code> is <code>absent</code>.</div>        </td></tr>
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
        <td><div>When <code>present</code>, ensures that the iApp service is created and running. When <code>absent</code>, ensures that the iApp service has been removed.</div>        </td></tr>
                <tr><td>template_content<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The contents of a valid iApp template in a tmpl file. This iApp Template should be versioned and tested for compatibility with iWorkflow Tenant Services and a BIG-IP version of 11.5.3.2 or later. This option is only required when creating new template in iWorkflow. When you are deleting iApp templates, you will need to specify either one of <code>name</code> or <code>template_content</code>.</div>        </td></tr>
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

    
    - name: Add AppSvcs Integration to iWorkflow
      iworkflow_iapp_template:
          device: "my-bigip-1"
          template_content: "{{ lookup('file', 'appsvcs_integration_v2.0_001.tmpl') }}"
          password: "secret"
          server: "lb.mydomain.com"
          state: "present"
          user: "admin"
      delegate_to: localhost
    
    - name: Remove AppSvcs Integration from iWorkflow
      iworkflow_iapp_template:
          name: "appsvcs_integration_v2.0_001"
          password: "secret"
          server: "lb.mydomain.com"
          state: "present"
          user: "admin"
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