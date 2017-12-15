.. _bigip_ssl_certificate:


bigip_ssl_certificate - Import/Delete certificates from BIG-IP
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.2


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* This module will import/delete SSL certificates on BIG-IP LTM. Certificates can be imported from certificate and key files on the local disk, in PEM format.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 3.0.3
  * BIG-IP >= v12


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
        <td><div>Sets the contents of a certificate directly to the specified value. This is used with lookup plugins or for anything with formatting or</div><div><code>content</code> must be provided when <code>state</code> is <code>present</code>.</div></br>
    <div style="font-size: small;">aliases: cert_content<div>        </td></tr>
                <tr><td>issuer_cert<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Issuer certificate used for OCSP monitoring.</div><div>This parameter is only valid on versions of BIG-IP 13.0.0 or above</div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>SSL Certificate Name. This is the cert name used when importing a certificate into the F5. It also determines the filenames of the objects on the LTM (:Partition:name.cer_11111_1 and :Partition_name.key_11111_1).</div>        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li></ul></td>
        <td><div>Certificate state. This determines if the provided certificate and key is to be made <code>present</code> on the device or <code>absent</code>.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Use a file lookup to import PEM Certificate
      bigip_ssl_certificate:
        name: certificate-name
        server: lb.mydomain.com
        user: admin
        password: secret
        state: present
        content: "{{ lookup('file', '/path/to/cert.crt') }}"
      delegate_to: localhost

    - name: Use a file lookup to import CA certificate chain
      bigip_ssl_certificate:
        name: ca-chain-name
        server: lb.mydomain.com
        user: admin
        password: secret
        state: present
        content: "{{ lookup('file', '/path/to/ca-chain.crt') }}"
      delegate_to: localhost

    - name: Delete Certificate
      bigip_ssl_certificate:
        name: certificate-name
        server: lb.mydomain.com
        user: admin
        password: secret
        state: absent
      delegate_to: localhost


Return Values
-------------

Common return values are `documented here <http://docs.ansible.com/ansible/latest/common_return_values.html>`_, the following are the fields unique to this module:

.. raw:: html

    <table border=1 cellpadding=4>
    <tr>
    <th class="head">name</th>
    <th class="head">description</th>
    <th class="head">returned</th>
    <th class="head">type</th>
    <th class="head">sample</th>
    </tr>

        <tr>
        <td> checksum </td>
        <td> SHA1 checksum of the cert that was provided. </td>
        <td align=center> changed and created </td>
        <td align=center> string </td>
        <td align=center> f7ff9e8b7bb2e09b70935a5d785e0cc5d9d0abf0 </td>
    </tr>
            <tr>
        <td> source_path </td>
        <td> Path on BIG-IP where the source of the certificate is stored. </td>
        <td align=center> created </td>
        <td align=center> string </td>
        <td align=center> /var/config/rest/downloads/cert1.crt </td>
    </tr>
            <tr>
        <td> cert_name </td>
        <td> The name of the certificate that the user provided </td>
        <td align=center> created </td>
        <td align=center> string </td>
        <td align=center> cert1 </td>
    </tr>
            <tr>
        <td> filename </td>
        <td> ['The name of the SSL certificate.'] </td>
        <td align=center> created </td>
        <td align=center> string </td>
        <td align=center> cert1.crt </td>
    </tr>
        
    </table>
    </br></br>

Notes
-----

.. note::
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - This module does not behave like other modules that you might include in roles where referencing files or templates first looks in the role's files or templates directory. To have it behave that way, use the Ansible file or template lookup (see Examples). The lookups behave as expected in a role context.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`/usage/support`


For help developing modules, should you be so inclined, please read :doc:`Getting Involved </development/getting-involved>`, :doc:`Writing a Module </development/writing-a-module>` and :doc:`Guidelines </development/guidelines>`.