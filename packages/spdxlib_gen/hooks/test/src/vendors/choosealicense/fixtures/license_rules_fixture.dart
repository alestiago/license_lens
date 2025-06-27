// Copyright (c) 2025 Alejandro Santiago
//
// This file is part of spdxlib_gen and is distributed under the terms of
// the MIT License.
//
// For complete licensing information, please refer to the README file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/LICENSE
//
// Full attribution information is provided in the NOTICE file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/NOTICE.md

abstract class ChooseALicenseLicenseRulesFixture {
  /// Raw result from the ChooseALicense license rules endpoint:
  /// https://api.github.com/repos/github/choosealicense.com/contents/_licenses
  /// (Accessed 27 June 2025).
  ///
  /// This fixture is used to test the parsing of the license rules without
  /// needing to download the rules from the internet.
  static const successGitHubContent = '''
[
  {
    "name": "0bsd.txt",
    "path": "_licenses/0bsd.txt",
    "sha": "be73691957124783ddcf0353a0db98860dd3de62",
    "size": 1669,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/0bsd.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/0bsd.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/be73691957124783ddcf0353a0db98860dd3de62",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/0bsd.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/0bsd.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/be73691957124783ddcf0353a0db98860dd3de62",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/0bsd.txt"
    }
  },
  {
    "name": "afl-3.0.txt",
    "path": "_licenses/afl-3.0.txt",
    "sha": "d324b210db31ee6080a5f8a506032797c1fee0f6",
    "size": 11142,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/afl-3.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/afl-3.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d324b210db31ee6080a5f8a506032797c1fee0f6",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/afl-3.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/afl-3.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d324b210db31ee6080a5f8a506032797c1fee0f6",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/afl-3.0.txt"
    }
  },
  {
    "name": "agpl-3.0.txt",
    "path": "_licenses/agpl-3.0.txt",
    "sha": "d671311997c35595b6c62cd0463382874e9d0256",
    "size": 35944,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/agpl-3.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/agpl-3.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d671311997c35595b6c62cd0463382874e9d0256",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/agpl-3.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/agpl-3.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d671311997c35595b6c62cd0463382874e9d0256",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/agpl-3.0.txt"
    }
  },
  {
    "name": "apache-2.0.txt",
    "path": "_licenses/apache-2.0.txt",
    "sha": "9b2c5698fd50e5a6b5a9a3dc9808f529ca4fb290",
    "size": 12624,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/apache-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/apache-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/9b2c5698fd50e5a6b5a9a3dc9808f529ca4fb290",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/apache-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/apache-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/9b2c5698fd50e5a6b5a9a3dc9808f529ca4fb290",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/apache-2.0.txt"
    }
  },
  {
    "name": "artistic-2.0.txt",
    "path": "_licenses/artistic-2.0.txt",
    "sha": "3fddba8802afb39207392d109aa7048c9c122a41",
    "size": 9649,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/artistic-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/artistic-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/3fddba8802afb39207392d109aa7048c9c122a41",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/artistic-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/artistic-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/3fddba8802afb39207392d109aa7048c9c122a41",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/artistic-2.0.txt"
    }
  },
  {
    "name": "blueoak-1.0.0.txt",
    "path": "_licenses/blueoak-1.0.0.txt",
    "sha": "f25e4ba389f78b5ddfba2de265ac9ab4c6fc10d5",
    "size": 2422,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/blueoak-1.0.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/blueoak-1.0.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/f25e4ba389f78b5ddfba2de265ac9ab4c6fc10d5",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/blueoak-1.0.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/blueoak-1.0.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/f25e4ba389f78b5ddfba2de265ac9ab4c6fc10d5",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/blueoak-1.0.0.txt"
    }
  },
  {
    "name": "bsd-2-clause-patent.txt",
    "path": "_licenses/bsd-2-clause-patent.txt",
    "sha": "ac49dd52738bc46f459a88b92cd3b4ebdedde080",
    "size": 3497,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-2-clause-patent.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-2-clause-patent.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/ac49dd52738bc46f459a88b92cd3b4ebdedde080",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/bsd-2-clause-patent.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-2-clause-patent.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/ac49dd52738bc46f459a88b92cd3b4ebdedde080",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-2-clause-patent.txt"
    }
  },
  {
    "name": "bsd-2-clause.txt",
    "path": "_licenses/bsd-2-clause.txt",
    "sha": "3c96161d37deee9ae3ecdbb7003e1f6343382313",
    "size": 2260,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-2-clause.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-2-clause.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/3c96161d37deee9ae3ecdbb7003e1f6343382313",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/bsd-2-clause.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-2-clause.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/3c96161d37deee9ae3ecdbb7003e1f6343382313",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-2-clause.txt"
    }
  },
  {
    "name": "bsd-3-clause-clear.txt",
    "path": "_licenses/bsd-3-clause-clear.txt",
    "sha": "40fe718a92d288f1917c4cebba394ec62feef8e1",
    "size": 2348,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-3-clause-clear.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-3-clause-clear.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/40fe718a92d288f1917c4cebba394ec62feef8e1",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/bsd-3-clause-clear.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-3-clause-clear.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/40fe718a92d288f1917c4cebba394ec62feef8e1",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-3-clause-clear.txt"
    }
  },
  {
    "name": "bsd-3-clause.txt",
    "path": "_licenses/bsd-3-clause.txt",
    "sha": "aba1b44316f30c6fb12ec1889ea97fbc9f287303",
    "size": 2505,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-3-clause.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-3-clause.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/aba1b44316f30c6fb12ec1889ea97fbc9f287303",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/bsd-3-clause.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-3-clause.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/aba1b44316f30c6fb12ec1889ea97fbc9f287303",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-3-clause.txt"
    }
  },
  {
    "name": "bsd-4-clause.txt",
    "path": "_licenses/bsd-4-clause.txt",
    "sha": "c5c4a3e4202c53676219f23ed680e7f72029ddbc",
    "size": 2705,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-4-clause.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-4-clause.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/c5c4a3e4202c53676219f23ed680e7f72029ddbc",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/bsd-4-clause.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsd-4-clause.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/c5c4a3e4202c53676219f23ed680e7f72029ddbc",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsd-4-clause.txt"
    }
  },
  {
    "name": "bsl-1.0.txt",
    "path": "_licenses/bsl-1.0.txt",
    "sha": "4cdf0f01e6c571a5f76e1f4d340c89594cba47ca",
    "size": 2423,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsl-1.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsl-1.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/4cdf0f01e6c571a5f76e1f4d340c89594cba47ca",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/bsl-1.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/bsl-1.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/4cdf0f01e6c571a5f76e1f4d340c89594cba47ca",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/bsl-1.0.txt"
    }
  },
  {
    "name": "cc-by-4.0.txt",
    "path": "_licenses/cc-by-4.0.txt",
    "sha": "176bb6930255c9859428728b4b5bdeb2ee40ae21",
    "size": 19759,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cc-by-4.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cc-by-4.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/176bb6930255c9859428728b4b5bdeb2ee40ae21",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cc-by-4.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cc-by-4.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/176bb6930255c9859428728b4b5bdeb2ee40ae21",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cc-by-4.0.txt"
    }
  },
  {
    "name": "cc-by-sa-4.0.txt",
    "path": "_licenses/cc-by-sa-4.0.txt",
    "sha": "9eb4b5dceb76b4910c84eec6e93870308c321f9c",
    "size": 21473,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cc-by-sa-4.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cc-by-sa-4.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/9eb4b5dceb76b4910c84eec6e93870308c321f9c",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cc-by-sa-4.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cc-by-sa-4.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/9eb4b5dceb76b4910c84eec6e93870308c321f9c",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cc-by-sa-4.0.txt"
    }
  },
  {
    "name": "cc0-1.0.txt",
    "path": "_licenses/cc0-1.0.txt",
    "sha": "a40cf103c1b8806fcb2507ec7f29935429e3b284",
    "size": 8437,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cc0-1.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cc0-1.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/a40cf103c1b8806fcb2507ec7f29935429e3b284",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cc0-1.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cc0-1.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/a40cf103c1b8806fcb2507ec7f29935429e3b284",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cc0-1.0.txt"
    }
  },
  {
    "name": "cecill-2.1.txt",
    "path": "_licenses/cecill-2.1.txt",
    "sha": "0db24f6532ecf3e2c2abd4211eac5e82b6507658",
    "size": 23872,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cecill-2.1.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cecill-2.1.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/0db24f6532ecf3e2c2abd4211eac5e82b6507658",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cecill-2.1.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cecill-2.1.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/0db24f6532ecf3e2c2abd4211eac5e82b6507658",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cecill-2.1.txt"
    }
  },
  {
    "name": "cern-ohl-p-2.0.txt",
    "path": "_licenses/cern-ohl-p-2.0.txt",
    "sha": "a69e25cc407a02431748de63c46b646340666789",
    "size": 10211,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cern-ohl-p-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cern-ohl-p-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/a69e25cc407a02431748de63c46b646340666789",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cern-ohl-p-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cern-ohl-p-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/a69e25cc407a02431748de63c46b646340666789",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cern-ohl-p-2.0.txt"
    }
  },
  {
    "name": "cern-ohl-s-2.0.txt",
    "path": "_licenses/cern-ohl-s-2.0.txt",
    "sha": "80af8a898001519ce422334754e0a481336ff1cd",
    "size": 14811,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cern-ohl-s-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cern-ohl-s-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/80af8a898001519ce422334754e0a481336ff1cd",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cern-ohl-s-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cern-ohl-s-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/80af8a898001519ce422334754e0a481336ff1cd",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cern-ohl-s-2.0.txt"
    }
  },
  {
    "name": "cern-ohl-w-2.0.txt",
    "path": "_licenses/cern-ohl-w-2.0.txt",
    "sha": "f7bbb68524c287604ecbe7c5ff88e6540cd84c75",
    "size": 16002,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cern-ohl-w-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cern-ohl-w-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/f7bbb68524c287604ecbe7c5ff88e6540cd84c75",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/cern-ohl-w-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/cern-ohl-w-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/f7bbb68524c287604ecbe7c5ff88e6540cd84c75",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/cern-ohl-w-2.0.txt"
    }
  },
  {
    "name": "ecl-2.0.txt",
    "path": "_licenses/ecl-2.0.txt",
    "sha": "72c6b9d7c6971af3faeaa8979ce5d80583c6e12c",
    "size": 12156,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ecl-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ecl-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/72c6b9d7c6971af3faeaa8979ce5d80583c6e12c",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/ecl-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ecl-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/72c6b9d7c6971af3faeaa8979ce5d80583c6e12c",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ecl-2.0.txt"
    }
  },
  {
    "name": "epl-1.0.txt",
    "path": "_licenses/epl-1.0.txt",
    "sha": "17ba189e3f72023257004b248a73c6c23507e772",
    "size": 12461,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/epl-1.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/epl-1.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/17ba189e3f72023257004b248a73c6c23507e772",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/epl-1.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/epl-1.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/17ba189e3f72023257004b248a73c6c23507e772",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/epl-1.0.txt"
    }
  },
  {
    "name": "epl-2.0.txt",
    "path": "_licenses/epl-2.0.txt",
    "sha": "864064b0c5ee74f7fbf9223d10f39691bc155fe8",
    "size": 15112,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/epl-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/epl-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/864064b0c5ee74f7fbf9223d10f39691bc155fe8",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/epl-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/epl-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/864064b0c5ee74f7fbf9223d10f39691bc155fe8",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/epl-2.0.txt"
    }
  },
  {
    "name": "eupl-1.1.txt",
    "path": "_licenses/eupl-1.1.txt",
    "sha": "dfb9a283bad39e43ac1c6dc7086870efee6d58da",
    "size": 14163,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/eupl-1.1.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/eupl-1.1.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/dfb9a283bad39e43ac1c6dc7086870efee6d58da",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/eupl-1.1.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/eupl-1.1.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/dfb9a283bad39e43ac1c6dc7086870efee6d58da",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/eupl-1.1.txt"
    }
  },
  {
    "name": "eupl-1.2.txt",
    "path": "_licenses/eupl-1.2.txt",
    "sha": "e0ce01303ce47bcc13b129a5008b7aeb351755de",
    "size": 14871,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/eupl-1.2.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/eupl-1.2.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/e0ce01303ce47bcc13b129a5008b7aeb351755de",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/eupl-1.2.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/eupl-1.2.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/e0ce01303ce47bcc13b129a5008b7aeb351755de",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/eupl-1.2.txt"
    }
  },
  {
    "name": "gfdl-1.3.txt",
    "path": "_licenses/gfdl-1.3.txt",
    "sha": "30e01e9d41028bfe71dab8d2e72f636c884437fa",
    "size": 23969,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/gfdl-1.3.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/gfdl-1.3.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/30e01e9d41028bfe71dab8d2e72f636c884437fa",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/gfdl-1.3.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/gfdl-1.3.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/30e01e9d41028bfe71dab8d2e72f636c884437fa",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/gfdl-1.3.txt"
    }
  },
  {
    "name": "gpl-2.0.txt",
    "path": "_licenses/gpl-2.0.txt",
    "sha": "79acf5cb765417e02cbeb048ae954cf1492cff4d",
    "size": 19289,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/gpl-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/gpl-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/79acf5cb765417e02cbeb048ae954cf1492cff4d",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/gpl-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/gpl-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/79acf5cb765417e02cbeb048ae954cf1492cff4d",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/gpl-2.0.txt"
    }
  },
  {
    "name": "gpl-3.0.txt",
    "path": "_licenses/gpl-3.0.txt",
    "sha": "0fb3da36c92760e28812aefcdfaae39553271780",
    "size": 36394,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/gpl-3.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/gpl-3.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/0fb3da36c92760e28812aefcdfaae39553271780",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/gpl-3.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/gpl-3.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/0fb3da36c92760e28812aefcdfaae39553271780",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/gpl-3.0.txt"
    }
  },
  {
    "name": "isc.txt",
    "path": "_licenses/isc.txt",
    "sha": "e7d30e04554b4159a8d61f8e7f12a8a20ad8a7c0",
    "size": 1744,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/isc.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/isc.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/e7d30e04554b4159a8d61f8e7f12a8a20ad8a7c0",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/isc.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/isc.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/e7d30e04554b4159a8d61f8e7f12a8a20ad8a7c0",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/isc.txt"
    }
  },
  {
    "name": "lgpl-2.1.txt",
    "path": "_licenses/lgpl-2.1.txt",
    "sha": "6ffdad8cb2829bb5acdb559b7eaa65aaf2c8255b",
    "size": 27491,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/lgpl-2.1.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/lgpl-2.1.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/6ffdad8cb2829bb5acdb559b7eaa65aaf2c8255b",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/lgpl-2.1.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/lgpl-2.1.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/6ffdad8cb2829bb5acdb559b7eaa65aaf2c8255b",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/lgpl-2.1.txt"
    }
  },
  {
    "name": "lgpl-3.0.txt",
    "path": "_licenses/lgpl-3.0.txt",
    "sha": "407ae1f5cfe4cf46064bc5934b6b8d4eba0aee75",
    "size": 9152,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/lgpl-3.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/lgpl-3.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/407ae1f5cfe4cf46064bc5934b6b8d4eba0aee75",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/lgpl-3.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/lgpl-3.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/407ae1f5cfe4cf46064bc5934b6b8d4eba0aee75",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/lgpl-3.0.txt"
    }
  },
  {
    "name": "lppl-1.3c.txt",
    "path": "_licenses/lppl-1.3c.txt",
    "sha": "43cb8ca97487c45918e185d056833ccf606eb91d",
    "size": 19902,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/lppl-1.3c.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/lppl-1.3c.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/43cb8ca97487c45918e185d056833ccf606eb91d",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/lppl-1.3c.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/lppl-1.3c.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/43cb8ca97487c45918e185d056833ccf606eb91d",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/lppl-1.3c.txt"
    }
  },
  {
    "name": "mit-0.txt",
    "path": "_licenses/mit-0.txt",
    "sha": "739b9924a80e595357c4d7e07fe9b3becba9f89b",
    "size": 1840,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mit-0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mit-0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/739b9924a80e595357c4d7e07fe9b3becba9f89b",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/mit-0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mit-0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/739b9924a80e595357c4d7e07fe9b3becba9f89b",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mit-0.txt"
    }
  },
  {
    "name": "mit.txt",
    "path": "_licenses/mit.txt",
    "sha": "1ad0488f90862b77498f734270508db723f8d025",
    "size": 1989,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mit.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mit.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/1ad0488f90862b77498f734270508db723f8d025",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/mit.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mit.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/1ad0488f90862b77498f734270508db723f8d025",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mit.txt"
    }
  },
  {
    "name": "mpl-2.0.txt",
    "path": "_licenses/mpl-2.0.txt",
    "sha": "e924030807f4181bf865d5b6ffbb90c5eef58c45",
    "size": 18104,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mpl-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mpl-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/e924030807f4181bf865d5b6ffbb90c5eef58c45",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/mpl-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mpl-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/e924030807f4181bf865d5b6ffbb90c5eef58c45",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mpl-2.0.txt"
    }
  },
  {
    "name": "ms-pl.txt",
    "path": "_licenses/ms-pl.txt",
    "sha": "951572ee21bbca07933d4562c76a1f9dc4114506",
    "size": 3226,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ms-pl.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ms-pl.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/951572ee21bbca07933d4562c76a1f9dc4114506",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/ms-pl.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ms-pl.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/951572ee21bbca07933d4562c76a1f9dc4114506",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ms-pl.txt"
    }
  },
  {
    "name": "ms-rl.txt",
    "path": "_licenses/ms-rl.txt",
    "sha": "d139ee8474b34c1d9bd93df194149dbe0c8004b4",
    "size": 3868,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ms-rl.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ms-rl.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d139ee8474b34c1d9bd93df194149dbe0c8004b4",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/ms-rl.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ms-rl.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d139ee8474b34c1d9bd93df194149dbe0c8004b4",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ms-rl.txt"
    }
  },
  {
    "name": "mulanpsl-2.0.txt",
    "path": "_licenses/mulanpsl-2.0.txt",
    "sha": "8b3d5986658f8c8f37fccf7670ea79a8f8be46fd",
    "size": 10377,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mulanpsl-2.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mulanpsl-2.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/8b3d5986658f8c8f37fccf7670ea79a8f8be46fd",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/mulanpsl-2.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/mulanpsl-2.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/8b3d5986658f8c8f37fccf7670ea79a8f8be46fd",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mulanpsl-2.0.txt"
    }
  },
  {
    "name": "ncsa.txt",
    "path": "_licenses/ncsa.txt",
    "sha": "9380cfa03d9a9726f8b9538b1e77a9947a3647db",
    "size": 2939,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ncsa.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ncsa.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/9380cfa03d9a9726f8b9538b1e77a9947a3647db",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/ncsa.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ncsa.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/9380cfa03d9a9726f8b9538b1e77a9947a3647db",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ncsa.txt"
    }
  },
  {
    "name": "odbl-1.0.txt",
    "path": "_licenses/odbl-1.0.txt",
    "sha": "d52fc91aa8fcdc921eff0c13f7c9f0a53ebfcb60",
    "size": 26179,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/odbl-1.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/odbl-1.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d52fc91aa8fcdc921eff0c13f7c9f0a53ebfcb60",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/odbl-1.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/odbl-1.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/d52fc91aa8fcdc921eff0c13f7c9f0a53ebfcb60",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/odbl-1.0.txt"
    }
  },
  {
    "name": "ofl-1.1.txt",
    "path": "_licenses/ofl-1.1.txt",
    "sha": "a31de6d714652c8ad591e4413fb77d809cffbf18",
    "size": 5824,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ofl-1.1.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ofl-1.1.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/a31de6d714652c8ad591e4413fb77d809cffbf18",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/ofl-1.1.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/ofl-1.1.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/a31de6d714652c8ad591e4413fb77d809cffbf18",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/ofl-1.1.txt"
    }
  },
  {
    "name": "osl-3.0.txt",
    "path": "_licenses/osl-3.0.txt",
    "sha": "05612b68eee1c6bb2e8e888e3b21d9bd841a59ae",
    "size": 11580,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/osl-3.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/osl-3.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/05612b68eee1c6bb2e8e888e3b21d9bd841a59ae",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/osl-3.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/osl-3.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/05612b68eee1c6bb2e8e888e3b21d9bd841a59ae",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/osl-3.0.txt"
    }
  },
  {
    "name": "postgresql.txt",
    "path": "_licenses/postgresql.txt",
    "sha": "897f1e817317d7ca63764a28b08daa713aecbf9c",
    "size": 1709,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/postgresql.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/postgresql.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/897f1e817317d7ca63764a28b08daa713aecbf9c",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/postgresql.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/postgresql.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/897f1e817317d7ca63764a28b08daa713aecbf9c",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/postgresql.txt"
    }
  },
  {
    "name": "unlicense.txt",
    "path": "_licenses/unlicense.txt",
    "sha": "fc4d4a5f66ad4a123aba9bc72ce23d249bacf5dc",
    "size": 2001,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/unlicense.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/unlicense.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/fc4d4a5f66ad4a123aba9bc72ce23d249bacf5dc",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/unlicense.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/unlicense.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/fc4d4a5f66ad4a123aba9bc72ce23d249bacf5dc",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/unlicense.txt"
    }
  },
  {
    "name": "upl-1.0.txt",
    "path": "_licenses/upl-1.0.txt",
    "sha": "79a2235a6b933ddd857084dd68f473883fd716cd",
    "size": 3253,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/upl-1.0.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/upl-1.0.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/79a2235a6b933ddd857084dd68f473883fd716cd",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/upl-1.0.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/upl-1.0.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/79a2235a6b933ddd857084dd68f473883fd716cd",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/upl-1.0.txt"
    }
  },
  {
    "name": "vim.txt",
    "path": "_licenses/vim.txt",
    "sha": "ca21d8a98278bfeb3faa889a628e93864ba18c38",
    "size": 6119,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/vim.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/vim.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/ca21d8a98278bfeb3faa889a628e93864ba18c38",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/vim.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/vim.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/ca21d8a98278bfeb3faa889a628e93864ba18c38",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/vim.txt"
    }
  },
  {
    "name": "wtfpl.txt",
    "path": "_licenses/wtfpl.txt",
    "sha": "bbe5160b8b26efe118b0c9054760aa92a7760bf6",
    "size": 948,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/wtfpl.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/wtfpl.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/bbe5160b8b26efe118b0c9054760aa92a7760bf6",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/wtfpl.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/wtfpl.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/bbe5160b8b26efe118b0c9054760aa92a7760bf6",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/wtfpl.txt"
    }
  },
  {
    "name": "zlib.txt",
    "path": "_licenses/zlib.txt",
    "sha": "911d7739e82e48a17a8f661b601540aa0add6047",
    "size": 1678,
    "url": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/zlib.txt?ref=gh-pages",
    "html_url": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/zlib.txt",
    "git_url": "https://api.github.com/repos/github/choosealicense.com/git/blobs/911d7739e82e48a17a8f661b601540aa0add6047",
    "download_url": "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/zlib.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/github/choosealicense.com/contents/_licenses/zlib.txt?ref=gh-pages",
      "git": "https://api.github.com/repos/github/choosealicense.com/git/blobs/911d7739e82e48a17a8f661b601540aa0add6047",
      "html": "https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/zlib.txt"
    }
  }
]
''';

  /// Manually created fixture of invalid JSON content that simulates a response
  /// from the GitHub API when the content is not valid JSON.
  static const invalidJsonGitHubContent = '''
{
"not-json": "This is not valid JSON",;!
}
''';

  /// Raw result from the ChooseALicense license rules endpoint:
  /// https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/0bsd.txt
  /// (Accessed 27 June 2025).
  ///
  /// This fixture is used to test the parsing of the license rules without
  /// needing to download the rules from the internet.
  static const successLicense = '''
---
title: BSD Zero Clause License
spdx-id: 0BSD

description: The BSD Zero Clause license goes further than the BSD 2-Clause license to allow you unlimited freedom with the software without requirements to include the copyright notice, license text, or disclaimer in either source or binary forms.

how: Create a text file (typically named LICENSE or LICENSE.txt) in the root of your source code and copy the text of the license into the file.  Replace [year] with the current year and [fullname] with the name (or names) of the copyright holders. You may take the additional step of removing the copyright notice.

using:
  gatsby-starter-default: https://github.com/gatsbyjs/gatsby-starter-default/blob/master/LICENSE
  Toybox: https://github.com/landley/toybox/blob/master/LICENSE
  PickMeUp: https://github.com/nazar-pc/PickMeUp/blob/master/copying.md

permissions:
  - commercial-use
  - distribution
  - modifications
  - private-use

conditions: []

limitations:
  - liability
  - warranty

---

BSD Zero Clause License

Copyright (c) [year] [fullname]

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
''';

  /// Manually created fixture of invalid license text that simulates a response
  /// from the ChooseALicense license rules endpoint when the license is
  /// invalid.
  static const invalidLicenseText = '''
---
title: Invalid License
spdx-id: INVALID
''';
}
