import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ticket/app_routes.dart';
import 'package:nes_ticket/components/cards/tmdb_image.dart';
import 'package:nes_ticket/gen/assets.gen.dart';
import 'package:nes_ticket/states/actions/trending/trending_state.dart';
import 'package:nes_ticket/states/stores/auth/auth_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

const double _angle = -0.349;
const List<Offset> _positions = [
  Offset(-30, 10),
  Offset(-30, 222.11),
  Offset(112.08, 10),
  Offset(112.08, 222.11),
  Offset(254.16, 10),
  Offset(254.16, 222.11),
  Offset(396.24, 10),
  Offset(396.24, 222.11),
  Offset(538.32, 10),
  Offset(538.32, 222.11),
];

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      ref.read(authProvider.notifier).login(email, password);

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.mainFrame,
        (route) => false,
      );
    } else {
      final mq = MediaQuery.of(context);
      final size = mq.size;
      final width = size.width * 0.24;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.up,
          backgroundColor: Color(0xFFFEF2F2),
          margin: EdgeInsets.only(
            bottom: size.height - 180,
            left: width,
            right: width,
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: Color(0xFFB91C1C).withValues(alpha: 0.1)),
          ),
          behavior: SnackBarBehavior.floating,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              PhosphorIcon(
                PhosphorIconsDuotone.xCircle,
                color: Color(0xFFB91C1C),
                size: 16,
              ),
              Text(
                'Isi form yang dibutuhkan',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  color: Color(0xFFB91C1C),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _onLoginAsGuest() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoute.mainFrame,
      (route) => false,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final linkStyle = GoogleFonts.plusJakartaSans(
      fontWeight: FontWeight.w600,
      color: Color(0xFF3B82F6),
      decoration: TextDecoration.underline,
    );

    final state = ref.watch(getTrendingDayProvider(ContentType.all));

    final List<String?> posterPaths = state.maybeWhen(
      data: (data) => data.take(10).map((m) => m.posterPath).toList(),
      orElse: () => [],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0),
      body: Stack(
        children: [
          if (posterPaths.isNotEmpty)
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white,
                    Colors.white,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.1, 0.0, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Opacity(
                opacity: 0.08,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: List.generate(_positions.length, (i) {
                    return Positioned(
                      left: _positions[i].dx,
                      top: _positions[i].dy,
                      child: Transform.rotate(
                        angle: _angle,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: TmdbImage(
                            posterPaths[i % posterPaths.length],
                            size: 'w300',
                            width: 126.08,
                            height: 189.11,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 139, 24, 32),
                  child: Column(
                    spacing: 32,
                    children: [
                      Column(
                        children: [
                          Assets.icons.ticket3d.image(
                            width: 96,
                            height: 96,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'TMDB',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Siap-siaplah untuk terjun ke dalam kisah-kisah terhebat di TV dan Film',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(fontSize: 14),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: GoogleFonts.plusJakartaSans(fontSize: 12),
                              decoration: InputDecoration(
                                hintText: 'Alamat Email',
                              ),
                              validator: (v) => (v == null || v.isEmpty)
                                  ? 'Email wajib diisi'
                                  : null,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              style: GoogleFonts.plusJakartaSans(fontSize: 12),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 18,
                                    color: const Color(0xFF71747D),
                                  ),
                                  onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  ),
                                ),
                              ),
                              validator: (v) => (v == null || v.isEmpty)
                                  ? 'Password wajib diisi'
                                  : null,
                            ),
                            SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _onLogin,
                                child: Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Color(0xFFEEEEEE))),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'atau',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 10,
                                height: 1.5,
                                color: const Color(0xFF71747D),
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xFFEEEEEE))),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: _onLoginAsGuest,
                          child: Text('Masuk Sebagai Tamu'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 41),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Dengan membuat akun atau masuk, Anda setuju dengan ',
              ),
              TextSpan(text: 'Ketentuan Layanan', style: linkStyle),
              TextSpan(text: ' dan '),
              TextSpan(text: 'Kebijakan Privasi', style: linkStyle),
              TextSpan(text: ' kami'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
