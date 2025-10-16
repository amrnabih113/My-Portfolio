'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "daf53f5082d2ca04bae22b020936b443",
".git/config": "f20d8ea8247bd9d25e87e3fc758ce8ca",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "7d36d5ddc3da4adae6c4bd46dd28f16b",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "7a9b32d97a13a7a24e749188cec0c1a5",
".git/logs/refs/heads/gh-pages": "3421726d0efc12a40b4485b5590c0947",
".git/logs/refs/remotes/origin/gh-pages": "05bc9465fb813ce31be17d001030d261",
".git/objects/00/feea2c5c7527422ddce6b6f5c596b50f09ca3b": "c81f284ba7ff7fd35d8ded840a53b2d6",
".git/objects/02/1d4f3579879a4ac147edbbd8ac2d91e2bc7323": "9e9721befbee4797263ad5370cd904ff",
".git/objects/04/d2a54a42c8f9242bcd50bab54554c9d21e42a2": "bbaca5db09757837376902586164657a",
".git/objects/05/d11cabc8e5c26df14cac5f931f8d24cea942ab": "b6a3f8071c17d1b4877b429ab11aa622",
".git/objects/09/65d21584efc246eb8a7e3d176239ccb2e2545d": "261a287ad64be3c897fc6e97acd360ca",
".git/objects/0d/ca6304c7fc1ec21291b3f82b3b7f2203d69208": "92d6b4ff09d69653cb001cce9538dd7c",
".git/objects/12/1a4094697d1ef3974004329ec5787a9da11a24": "14bfc3c1c56e863d9de80af16ae89e23",
".git/objects/12/325b17ea4a7c53637d6cf6eaafd05792d9fa20": "54180336c7e94afd3867ded3e835c544",
".git/objects/13/4ab208ece4f84a49694b446a9df73612dada49": "161f4004a16e1303266403a3635e676e",
".git/objects/1c/1c9cd118b142a3332e9c54d8c359831ca524e4": "dde3295df88b38fb9e755f5b6c177e86",
".git/objects/1c/97fefe50b8939dc44384bdc4ac35fd3514c338": "e56407596c18c3ddee98dc3a9fc83c78",
".git/objects/1f/663c595afbd4eb6f6cf161f01d0ee6e6bd7ba4": "24d3ee7d2453709df2674d41e0059a9a",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/2f/50b0f70694187af0a5b2cf407c5bce98c38a06": "346b3bdb055429b3998922bf1237d0d9",
".git/objects/31/c4ad027dbddc0761be4991bd1b2c5f38d731d4": "5c38401c38cad66308d54dbbaeb475c0",
".git/objects/34/1ab8a2d47e6770d10fe37938d3d96401416256": "573c15f5083330462855a93ad3f0b24b",
".git/objects/34/df5dc67778e468dda0895f625778019afa51c5": "ed84ae46fa850785356da33e9b4b9b00",
".git/objects/37/59f2d4446573def69a7eb34ab8680106dec130": "9cfd299ff26f3412317da0ec421d95df",
".git/objects/43/c82390e9c8407208abcbb8a15634312cf9e37e": "ef99cafff5701fa4a713f4ac36f66a13",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/853b6e2063fa7fb5dae7fa32b8b5ea05991f9e": "1de54c05d40fd99ea49b80bd30b7a71a",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/50/ec116c1aa9e6d60821669b9e33486a875a84c0": "9ac6bd89101dce8bbf53e89998197ab5",
".git/objects/58/7005f43f6abd2a248b1ae9e34b50cc917c3e48": "c6c1cd90a7943603e6d72c06bfefdead",
".git/objects/58/a04ea5ffba679190013bb08b4147173a90c3fc": "cbd2a8b1cc76a1cbde7599511b94fd36",
".git/objects/5f/0be49523927f81415c2e62ce427503e45baf1c": "af900b98d0c8d834da4853c3c47e10e8",
".git/objects/64/8a9076f6bb9444ad4eb3f24040b5c19a90b40b": "8ae04a33498f1a92c1306f66e179af7b",
".git/objects/65/3bb788fcdc29917b1ebbcc928a5e5001729470": "8623898d629ab279f307eb099fd958ff",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6e/26aca6e5c46286d8d95cd51cbe58db80dca957": "879150544c89c8128c55354aa288496b",
".git/objects/6e/c9bbf5c4cae64c26b90438d422fab314d2ff21": "3b9c1fe1c7935e462587cfd652fe16ad",
".git/objects/73/5179c15fb7e8e030377a7677ce72d8cc010eb0": "84a303c0a1ee6c797c77dc57757384d7",
".git/objects/75/d739f2ad90e2d9e2e4b48794ba6cb3b4b8a62b": "572e5d6052b6bc64abe7af628268a403",
".git/objects/76/69e326935889100a54408ed5938ba5dc849a19": "c633e4c428648923508c7bf37f2b49d8",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/7b/9db62ac9b231671b3999c17a5cc1f2bea7481c": "ed39380c1783e266f78c280ed443392d",
".git/objects/87/dc8dbbe46b0a87fff64f2baff0f21a37c91cd1": "acbf58e21677c6f9aff178e8385717ab",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/7ae380931a46754e91db81a1b1dd4732bcc8fb": "64976b1608f3c430da834da7e9f0549e",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/fd76b7f56e320ff120b6a14c7c8c160863f340": "257f940c7b9c1ebdd3a9afde9cddf73d",
".git/objects/8f/32e990f6ae7b3029b7db3015bc7cf78ba611ed": "020bb1d6d299b2c2bbe3186a1a6d7384",
".git/objects/95/c1aa7d1129d24ea2583f899d1691753e1f4fa5": "55df1df18d8b899b6b4cb40d3beb7ea0",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9c/ca7089e9e9e2bfdf63138edb5bb7557ba0a53e": "1aa7763570f65549c641dbbe9ba2400c",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/a3/d6c650bbe25aaa2603b0df439b4df4d02853e7": "08b82833858184f51b1866e1b5932adc",
".git/objects/b0/d2b8f2790dcef68e7e1457c28a103070962c25": "b610ab5a5eb501715b70b1a50c7ba3cd",
".git/objects/b3/d80b2b32da445f5f7df30506bd258b48a4c631": "2ab2c7bdcf34ad3b1a18db56c91204d4",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/f3f75526fb13dcfc378ac75ddac0cfef205cb6": "eafa015061b31438ea813e94d2c479f9",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c0/94c1cb1c3701a23cef64d62a3390916ed77333": "75a4a496abc13f9f482b1fba67c17af1",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/c8/1f0b71d09efec5ec668e911f9163eed3b10a69": "f1f6b6ab74af9e91da09b61ffaea46b0",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/cd/794088a3fae6dc195df7e7ebb88b1e5be5c8fe": "9455759d361ba390393ecb20b7fa3f2a",
".git/objects/cf/621570a39c81b78815b2dbb75f4a79373804d8": "e305a7c82d2d8544b3e30c5f03748a81",
".git/objects/d0/305de5d7e1415852a4fbf56d05b0ae498bb382": "87c87ae427da88d646427db373d97ac0",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/50e76df659933eef5a50023e6202e6afd1b035": "dfb3d860779e59160c993f7efeb0db08",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d9/57a1731615c5b3a30eb7b8c785ba7aed0ad39e": "81fac30033387326167813ea712e7f20",
".git/objects/dc/0dca7e748e6ea2d6fecfa29fb8b6682a42b96f": "0f4ec0a34715c15b90ce0bd92884808e",
".git/objects/de/3712a05122064e187c51b696b3c9e612084df0": "a9bf690b4bdc6e518dccbc63c8411e3a",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e4/d2cf77fd94087ebc347498c62488a576d0e377": "d2d85dc1190ecfcbdfd03bad668564c4",
".git/objects/e6/539f1eab851420a0b7a41d12dd234583a44189": "cafcde019c36351ea5b92b1a354cc172",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/70ed4f232f4736330ec3e2a945a5242972c7da": "581ff7d0ec056ab47dace832e5a3df7b",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f5/edc49ac7fe24d25b8052636326332b34c7583e": "74db514b56c40dac81e1bb39667e360a",
".git/objects/fd/ebaf7faa4bbb5246fa8c08453db410d9840d38": "07a897a53b7d3dd57f146817bd3a37d7",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/ff/85b10d50cd0ae5f72e6838b81a8549feb88b4b": "0cd1c603a52d0ccb92cfa274813d4e16",
".git/objects/ff/8ccb6efe0a01e378d8acd4d97fdb8f9f3bfe30": "fdf40cf8d579934e6340a938f7ed6160",
".git/refs/heads/gh-pages": "26083751723dc991fe698539cbb80330",
".git/refs/remotes/origin/gh-pages": "82f23972d58ea42cfbf06818de0d1e9c",
"assets/AssetManifest.bin": "424e487ea3523397988664a6d8a76133",
"assets/AssetManifest.bin.json": "574be88704608f4f3d9ad50214831e11",
"assets/AssetManifest.json": "f103772334d2b2762a89d0fa109273bb",
"assets/assets/images/profile.jpg": "7758e356f990edc039fff0e05f4ab622",
"assets/assets/images/skills/README.md": "bf7378942e08c7c07669d5c57a3fd928",
"assets/assets/logos/bloc_logo.png": "df21f4f5241b31d7a2d47e55333d82e2",
"assets/assets/logos/c%2523_logo.png": "c37eec21c606a75b3c717ce903d27344",
"assets/assets/logos/c++_logo.png": "00839965bf5bfe3f97c5335b6476a4b7",
"assets/assets/logos/css_logo.png": "ed0b7e488c85011d7b0ab5fabc8fa1c0",
"assets/assets/logos/c_logo.png": "c9e7e809c21d74209cd65443168956c6",
"assets/assets/logos/dart_logo.png": "679706f9c3ecbce2499af5c554b22286",
"assets/assets/logos/dotnet_core_logo.png": "2eef64d2f9e8d42243477e5243beb4b2",
"assets/assets/logos/figma_logo.png": "c5ae44625c5d80628dd03ba7645431c0",
"assets/assets/logos/firebase_logo.png": "7611a35d8089d12e55641cda9489e9ff",
"assets/assets/logos/flutter_logo.png": "d7a106a4fe6ee6d68cc3fe89b754f5a3",
"assets/assets/logos/getx_logo.png": "00a36cb3659dc7c3ac1d16e2113a7d4c",
"assets/assets/logos/github_logo.png": "cc36db1ac6554502d241364ee658eb80",
"assets/assets/logos/html_logo.png": "f581ea44cba5cb7cc2b55e8104485d77",
"assets/assets/logos/linkedin.png": "aee551451c73e5a9f592d0d90ae4a66f",
"assets/assets/logos/logo.png": "4c0f37b989f51f2dd321388cb2d7df05",
"assets/assets/logos/provider_logo.png": "c7beddb2283cf52f25a736844854b2fe",
"assets/assets/logos/python_logo.png": "c4105476d637a9159a5b74a376ae39b4",
"assets/assets/logos/sqllite_logo.png": "2dffe71facd8573964f225f11118cdae",
"assets/assets/logos/sqlserver_logo.png": "fc2a77654f44d310f640c75ebab14e95",
"assets/assets/logos/supabase_logo.png": "d11bef4ec558002e456a78a311f227b1",
"assets/assets/logos/vs_code_logo.png": "f9e0c87591215974113fbf2355499a13",
"assets/assets/projects/A-Store.jpg": "99a4b15bb682a51ea24dcd9d3ffdef26",
"assets/assets/projects/furfriends.jpg": "934ab17333e6f0a65d1be3871944004f",
"assets/assets/projects/knowva.jpg": "2bbb3897067f2bd42514e068e738992e",
"assets/assets/projects/smartFin.jpg": "668383def57f202e1b78a7c95986e28b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "8c6dd4e9e64261ac66bf57e83a0097cd",
"assets/NOTICES": "aa5275ade03bbe177513c7f82bd5f36c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "43b1a176207905f359330bb21e4a65e0",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d1209517ead0889518bcc1f504af9f06",
"/": "d1209517ead0889518bcc1f504af9f06",
"main.dart.js": "781bc7d9394c37336699779d51450998",
"manifest.json": "07f66434d604ccac1b4d5244f35598aa",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
