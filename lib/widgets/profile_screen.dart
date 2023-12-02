import 'package:flutter/material.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/profile_info_item.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO 1 : variable
  bool isSigned = false;
  String fullName = "";
  String userName = "";
  int favouriteCandiCount = 0;

  //TODO 5 : fungsisign in
  void signIn() {
    setState(() {
      //isSigned = !isSigned;
      Navigator.pushNamed(context, '/signin');
    });
  }

  //TODO 6 : fungsi sign out
  void signOut() {
    setState(() {
      isSigned = !isSigned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Candi'),
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //TODO 2 : Profile Header
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSigned)
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.red,
                              ))
                      ],
                    ),
                  ),
                ),
                //TODO 3 : Profile Info
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Pengguna",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ': $userName',
                      style: const TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Nama",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ': $fullName',
                      style: const TextStyle(fontSize: 18),
                    )),
                    if (isSigned) Icon(Icons.edit),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Favorit",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ': $favouriteCandiCount',
                      style: const TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 20,
                ),

                //TODO 4 : Profile Action
                isSigned
                    ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                    : TextButton(onPressed: signIn, child: Text('Sign In'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // TODO 1 : Deklarasikan Variabel
//   bool isSignedIn = true;
//   String fullName = "Universitas MDP";
//   String userName = "MDP";
//   int favoriteCandiCount = 0;
  

//   // TODO 5 : funsi SIGN IN
//   void signIn() {
//     setState(() {
//       isSignedIn = !isSignedIn;
//     });
//   }

//   // TODO 6 : funsi SIGN OUT
//   void signOut() {
//     setState(() {
//       isSignedIn = !isSignedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             color: Colors.deepPurple,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // TODO 2 : profile Header
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 200 - 50),
//                     child: Stack(
//                       alignment: Alignment.bottomRight,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             border:
//                                 Border.all(color: Colors.deepPurple, width: 2),
//                             shape: BoxShape.circle,
//                           ),
//                           child: const CircleAvatar(
//                             radius: 50,
//                             backgroundImage:
//                                 AssetImage('images/placeholder_image.png'),
//                           ),
//                         ),
//                         if (isSignedIn)
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.camera_alt,
//                               color: Colors.red,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // TODO 3 : profile Info
//                 const SizedBox(height: 20),
//                 const Divider(color: Colors.deepPurple),
//                 const SizedBox(height: 4),

//                 // Row(
//                 //   children: [
//                 //     SizedBox(
//                 //       width: MediaQuery.of(context).size.width / 3,
//                 //       child: Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.lock,
//                 //             color: Colors.amber,
//                 //           ),
//                 //           SizedBox(width: 8),
//                 //           Text(
//                 //             'Pengguna',
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //               fontWeight: FontWeight.bold,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     Expanded(
//                 //       child: Text(
//                 //         ': $userName',
//                 //         style: TextStyle(fontSize: 18),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
                
//                 ProfileInfoItem(
//                   icon: Icons.lock, 
//                   label: 'Pengguna', 
//                   value: userName, 
//                   iconColor: Colors.amber,
//                 ),

//                 const SizedBox(height: 20),
//                 const Divider(color: Colors.deepPurple),
//                 const SizedBox(height: 4),

//                 // Row(
//                 //   children: [
//                 //     SizedBox(
//                 //       width: MediaQuery.of(context).size.width / 3,
//                 //       child: Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.person,
//                 //             color: Colors.blue,
//                 //           ),
//                 //           SizedBox(width: 8),
//                 //           Text(
//                 //             'Nama',
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //               fontWeight: FontWeight.bold,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     Expanded(
//                 //       child: Text(
//                 //         ': $fullName',
//                 //         style: TextStyle(fontSize: 18),
//                 //       ),
//                 //     ),
//                 //     if (isSignedIn) Icon(Icons.edit),
//                 //     
//                 //   ],
//                 // ),

//                 ProfileInfoItem(
//                   icon: Icons.person, 
//                   label: 'Nama', 
//                   value: fullName, 
//                   showEditIcon: isSignedIn,
//                   onEditPressed: () {
//                     debugPrint('Icon Edit Saat Ditekan ... ');
//                   },
//                   iconColor: Colors.blue,
//                 ),

//                 const SizedBox(height: 20),
//                 const Divider(color: Colors.deepPurple),
//                 const SizedBox(height: 4),

//                 // Row(
//                 //   children: [
//                 //     SizedBox(
//                 //       width: MediaQuery.of(context).size.width / 3,
//                 //       child: Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.favorite,
//                 //             color: Colors.red,
//                 //           ),
//                 //           SizedBox(width: 8),
//                 //           Text(
//                 //             'Favorit',
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //               fontWeight: FontWeight.bold,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     Expanded(
//                 //       child: Text(
//                 //         ': $favoriteCandiCount',
//                 //         style: TextStyle(fontSize: 18),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),

//                 ProfileInfoItem(
//                   icon: Icons.favorite, 
//                   label: 'favorit', 
//                   value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '', 
//                   iconColor: Colors.red,
//                 ),

//                 const SizedBox(height: 20),
//                 const Divider(color: Colors.deepPurple),
//                 const SizedBox(height: 4),

//                 // TODO 4 : profile Action
//                 isSignedIn
//                     ? TextButton(onPressed: signOut, child: Text("Sign Out"))
//                     : TextButton(onPressed: signIn, child: Text("Sign In")),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
