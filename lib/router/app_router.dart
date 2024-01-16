import 'package:go_router/go_router.dart';
import 'package:luna_aconstruction/presentation/screens/home_screen.dart';


final appRouter = GoRouter(routes: [
  
  GoRoute( 
    path: '/',
    builder: (context, state) => const HomeScreen(),
   ),

  // GoRoute( 
  //   path: '/apply',
  //   builder: (context, state) => const ApplyScreen(),
  //  )


]);
