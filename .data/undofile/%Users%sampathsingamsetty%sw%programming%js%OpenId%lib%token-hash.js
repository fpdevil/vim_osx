Vim�UnDo� q	��<]�,�����Q����I��z���   1                                   Y�X$    _�                              ����                                                                                                                                                                                                                                                                                                                                                             Y�X#    �   /   1          �   .   0          "accessTokenHash.valid = validate;�   -   /          %accessTokenHash.generate = generate;�   ,   .          "const accessTokenHash = validate;�   +   -          �   *   ,          }�   )   +          +  return sliced_digest.toString('base64');�   (   *          :  var sliced_digest = digest.slice(0, digest.length / 2);�   '   )          8  // return encode(digest.slice(0, digest.length / 2));�   &   (          D  const digest = createHash(hashAlg || alg).update(token).digest();�   %   '          �   $   &            }�   #   %              }�   "   $                  hashAlg = 'sha256';�   !   #                default:�       "                  break;�      !                  hashAlg = 'sha384';�                       case '384':�                        break;�                        hashAlg = 'sha512';�                      case '512':�                    switch (size) {�                �                (    const size = String(alg).slice(-3);�                "  if (ALGS.indexOf(alg) === -1) {�                  let hashAlg;�                �                (  assert.equal(typeof token, 'string');�                 function generate(token, alg) {�                �                }�                *  return generate(token, alg) === actual;�                  if (!alg) return false;�                &  const alg = LENGTHS[actual.length];�                  if (!actual) return false;�                #function validate(actual, token) {�                �   
             -const ALGS = ['sha256', 'sha384', 'sha512'];�   	             >const LENGTHS = { 22: 'sha256', 32: 'sha384', 43: 'sha512' };�      
          �      	          /// const encode = require('base64url').encode;�                1const createHash = require('crypto').createHash;�                "const assert = require('assert');�                �                'use strict';�                 */�                , * helper for calculating the at_hash value�                 /**5��